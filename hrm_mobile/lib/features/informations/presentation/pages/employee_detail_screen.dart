// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/features/leave/presentation/pages/leave_request_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:hrm_mobile/core/models/global_form.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';
import 'package:hrm_mobile/features/informations/presentation/provider/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class EmployeeDetailScreen extends StatefulWidget {
  final UserEntity? inputUser;
  final bool isMyProfile;
  const EmployeeDetailScreen({Key? key, this.inputUser, required this.isMyProfile}) : super(key: key);

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  late FormGroup _form;

  @override
  void initState() {
    _form = editUserForm;
    initData();
    super.initState();
  }

  initData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // ----------------LOGIC-----------------
    // If is open personal profile => get token user id and find data
    // If is opened from user list => get user's clicked id and find data
    if (widget.isMyProfile) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("accessToken");
      if (token != null) {
        if (JwtDecoder.tryDecode(token) != null) {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
          var userId = decodedToken['user']['userId'];
          await userProvider.getUserById(widget.isMyProfile, userId);
        }
      }
    } else {
      await userProvider.getUserById(widget.isMyProfile, widget.inputUser!.userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    if ((widget.isMyProfile && userProvider.loggedInUser != null) ||
        (!widget.isMyProfile && userProvider.currentUser != null)) {
      _form = updateForm(_form, widget.isMyProfile ? userProvider.loggedInUser! : userProvider.currentUser!);
    }
    return ReactiveForm(
        formGroup: _form,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Profile",
            leadingIcon: widget.isMyProfile
                ? IconButton(icon: const Icon(Icons.menu), onPressed: () {})
                : IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left),
                    onPressed: () => {
                          Provider.of<UserProvider>(context, listen: false).getEmployeePaging(),
                          Navigator.of(context).pop()
                        }),
            button_1: !widget.isMyProfile ? IconButton(
              icon: const Icon(Icons.assignment_return),
              tooltip: 'refresh',
              onPressed: () => showDialog(
                  context: context, builder: (BuildContext context) => Dialog.fullscreen(child: LeaveRequestScreen(userEntity: widget.inputUser))),
            ) : null,
          ),
          body: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProfileHeader(context, widget.isMyProfile),
                _buildProfileEditor(context, _form, widget.isMyProfile),
              ],
            ),
          ),
          bottomNavigationBar: ReactiveFormConsumer(builder: (context, formGroup, child) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: userProvider.isSaving
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : FilledButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: _form.valid
                            ? () async {
                                var saveUser = UserEntity(
                                    firstName: _form.control('firstName').value,
                                    middleName: _form.control('middleName').value,
                                    lastName: _form.control('lastName').value,
                                    gender: _form.control('gender').value,
                                    birth: _form.control('birth').value,
                                    nationality: _form.control('nationality').value,
                                    jobTitle: _form.control('jobTitle').value,
                                    dateStartConttract: _form.control('dateStartContract').value,
                                    email: _form.control('email').value,
                                    phoneNumber: _form.control('phoneNumber').value,
                                    userId: widget.isMyProfile
                                        ? userProvider.loggedInUser!.userId
                                        : userProvider.currentUser!.userId,
                                    ownerId: widget.isMyProfile
                                        ? userProvider.loggedInUser!.ownerId
                                        : userProvider.currentUser!.userId);
                                var result = await userProvider.saveEmployee(saveUser, widget.isMyProfile);
                                if (result) {
                                  const snackBar = SnackBar(
                                    content: Text('Succeed'),
                                  );
                                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Failed'),
                                  );
                                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              }
                            : null,
                        child: const Text('Save'),
                      ));
          }),
        ));
  }
}

FormGroup updateForm(FormGroup form, UserEntity entity) {
  form.control('firstName').updateValue(entity.firstName);
  form.control('middleName').updateValue(entity.middleName);
  form.control('lastName').updateValue(entity.lastName);
  form.control('email').updateValue(entity.email);
  form.control('birth').updateValue(entity.birth);
  form.control('gender').updateValue(entity.gender);
  form.control('nationality').updateValue(entity.nationality);
  form.control('phoneNumber').updateValue(entity.phoneNumber);
  form.control('jobTitle').updateValue(entity.jobTitle);
  form.control('dateStartContract').updateValue(entity.dateStartConttract?.toLocal());
  FormControl? control = form.control('dateStartContract') as FormControl?;
  // the control is disabled and also the widget in UI is disabled.
  control!.markAsDisabled();
  return form;
}

Widget _buildProfileEditor(BuildContext context, FormGroup form, bool isMyProfile) {
  final userProvider = Provider.of<UserProvider>(context);

  return userProvider.isLoading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : Flexible(
          fit: FlexFit.tight,
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 65,
                  child: TabBar(
                    // labelColor: Colors.black,
                    // unselectedLabelColor: Colors.red,
                    // indicatorColor: Colors.green,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_circle_rounded),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.work_history),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Job',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.contacts),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Column(
                              children: [
                                ReactiveTextField(
                                  formControlName: 'firstName',
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'First Name',
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ReactiveTextField(
                                  formControlName: 'middleName',
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Middle Name',
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ReactiveTextField(
                                  formControlName: 'lastName',
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Last Name',
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ReactiveTextField(
                                  formControlName: 'gender',
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Gender',
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ReactiveDateTimePicker(
                                  formControlName: 'birth',
                                  type: ReactiveDatePickerFieldType.date,
                                  dateFormat: DateFormat.yMMMMd(),
                                  style: const TextStyle(fontWeight: FontWeight.normal),
                                  decoration: const InputDecoration(
                                    labelText: 'Date of birth',
                                    hintText: 'birth',
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ReactiveTextField(
                                  formControlName: 'nationality',
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Nationaity',
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: Column(
                              children: [
                                ReactiveTextField(
                                  formControlName: 'jobTitle',
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Job Title',
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ReactiveDateTimePicker(
                                  formControlName: 'dateStartContract',
                                  type: ReactiveDatePickerFieldType.date,
                                  dateFormat: DateFormat.yMMMMd(),
                                  disabledOpacity: 0.9,
                                  style: const TextStyle(fontWeight: FontWeight.normal),
                                  decoration: const InputDecoration(
                                    labelText: 'Date Start Contract',
                                    hintText: 'Date Start Contract',
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            )),
                      ),
                      SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          children: [
                            ReactiveTextField(
                              formControlName: 'email',
                              obscureText: false,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ReactiveTextField(
                              formControlName: 'phoneNumber',
                              obscureText: false,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone Number',
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ));
}

Widget _buildProfileHeader(BuildContext context, bool isMyProfile) {
  final userProvider = Provider.of<UserProvider>(context);
  SampleItem? selectedItem;
  return Expanded(
    flex: 0,
    child: Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 5,
              child: Row(children: [
                GestureDetector(
                  onTap: (userProvider.isUploadingImage || !isMyProfile)
                      ? null
                      : () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
                          if (xFile != null) {
                            File image = File(xFile.path);
                            if (context.mounted) userProvider.uploadProfileAvatar(image, context);
                          }
                        },
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 36,
                      backgroundImage: NetworkImage(isMyProfile
                          ? userProvider.loggedInUser?.avatarUrl ?? defaultImageUrl
                          : userProvider.currentUser?.avatarUrl ?? defaultImageUrl),
                      child: userProvider.isUploadingImage ? const CircularProgressIndicator() : null),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(child: BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                  if (state is LoggedInState) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              isMyProfile
                                  ? '${userProvider.loggedInUser!.firstName ?? ""} ${userProvider.loggedInUser!.middleName ?? ""} ${userProvider.loggedInUser!.lastName ?? ""}'
                                  : '${userProvider.currentUser!.firstName ?? ""} ${userProvider.currentUser!.middleName ?? ""} ${userProvider.currentUser!.lastName ?? ""}',
                              style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            isMyProfile
                                ? userProvider.loggedInUser!.jobTitle ?? "No position"
                                : userProvider.currentUser!.jobTitle ?? "No position",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          )
                        ]);
                  } else {
                    return Container();
                  }
                })),
              ])),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: isMyProfile
                ? Container()
                : PopupMenuButton<SampleItem>(
                    initialValue: selectedItem,
                    onSelected: (SampleItem item) {},
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                      PopupMenuItem<SampleItem>(
                        value: SampleItem.itemOne,
                        child: const Text('Call'),
                        onTap: () async {
                          var phoneNumber = isMyProfile
                              ? userProvider.loggedInUser?.phoneNumber ?? ""
                              : userProvider.currentUser?.phoneNumber ?? "";
                          await openLaunchURL("phone", phoneNumber, context);
                        },
                      ),
                      PopupMenuItem<SampleItem>(
                        value: SampleItem.itemTwo,
                        child: const Text('Text'),
                        onTap: () async {
                          var phoneNumber = isMyProfile
                              ? userProvider.loggedInUser?.phoneNumber ?? ""
                              : userProvider.currentUser?.phoneNumber ?? "";
                          await openLaunchURL("text", phoneNumber, context);
                        },
                      ),
                      PopupMenuItem<SampleItem>(
                        value: SampleItem.itemThree,
                        child: const Text('Send mail'),
                        onTap: () async {
                          var email = isMyProfile
                              ? userProvider.loggedInUser?.email ?? ""
                              : userProvider.currentUser?.email ?? "";
                          await openLaunchURL("mail", email, context);
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),
    ),
  );
}

Future<void> openLaunchURL(String type, String contact, BuildContext context) async {
  switch (type) {
    case "phone":
      if (contact.isNotEmpty) {
        final Uri url = Uri.parse('tel:$contact');
        if (!await launchUrl(url)) {
          if (context.mounted)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not launch $url')));
        }
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No phone numer')));
      }
      break;
    case "text":
      if (contact.isNotEmpty) {
        final Uri url = Uri.parse('sms:$contact');
        if (!await launchUrl(url)) {
          if (context.mounted)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not launch $url')));
        }
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No phone numer')));
      }
      break;
    case "mail":
      if (contact.isNotEmpty) {
        final Uri url = Uri.parse('mailto:$contact');
        if (!await launchUrl(url)) {
          if (context.mounted)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not launch $url')));
        }
      } else if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No email')));
      }
      break;
  }
}
