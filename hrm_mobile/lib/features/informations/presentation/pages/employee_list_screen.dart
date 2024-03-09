import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/models/global_form.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/informations/presentation/pages/employee_detail_screen.dart';
import 'package:hrm_mobile/features/informations/presentation/provider/user_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ListEmployeeScreen extends StatefulWidget {
  const ListEmployeeScreen({super.key});

  @override
  State<ListEmployeeScreen> createState() => _ListEmployeeScreenState();
}

class _ListEmployeeScreenState extends State<ListEmployeeScreen> {
  final ScrollController _sc = ScrollController();
  final TextEditingController birthDateRangeController = TextEditingController();
  final TextEditingController dateStartContractController = TextEditingController();
  late FormGroup _form;
  @override
  void initState() {
    initData();
    _form = employeeFilterForm;
    super.initState();
  }

  Future<void> initData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.resetList(true);
    await userProvider.getEmployeePaging();
    _sc.addListener(() async {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        await userProvider.getEmployeePaging();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    return Scaffold(
        appBar: CustomAppBar(
          title: "Employees",
          leadingIcon: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          button_1: IconButton(
            icon: const Icon(Icons.filter_list_alt),
            tooltip: 'Filter',
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog.fullscreen(child: _buildFilterDialog()),
            ),
          ),
        ),
        body: userProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: !userProvider.isLoading
                    ? userProvider.userLst != null
                        ? userProvider.userLst!.length
                        : 0
                    : 0,
                controller: _sc,
                itemBuilder: (_, index) {
                  if (index == userProvider.userLst!.length && !userProvider.isMaxOfList) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: LinearProgressIndicator(),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => EmployeeDetailScreen(
                                      inputUser: userProvider.userLst?[index],
                                      isMyProfile: false,
                                    )))
                          },
                          leading: const CircleAvatar(
                            radius: 24,
                            child: Text('DH'),
                          ),
                          title: Text('${userProvider.userLst?[index].firstName ?? ""} ${userProvider.userLst?[index].middleName ?? ""} ${userProvider.userLst?[index].lastName ?? ""}'),
                          subtitle: Text(
                            userProvider.userLst?[index].jobTitle ?? "No position",
                            style: const TextStyle(color: Color(0xFF4B4639)),
                          ),
                        ),
                        const Divider(height: 0),
                      ],
                    );
                  }
                }));
  }

  Widget _buildFilterDialog() {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    return SingleChildScrollView(
      child: ReactiveForm(
          formGroup: _form,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReactiveTextField(
                  formControlName: 'employeeName',
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Employee Name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ReactiveTextField(
                  formControlName: 'gender',
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: birthDateRangeController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Date of birth',
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                  ),
                  onTap: () {
                    _selectDate('birth');
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ReactiveTextField(
                  formControlName: 'nationality',
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Nationality',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ReactiveTextField(
                  formControlName: 'phoneNumber',
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ReactiveTextField(
                  formControlName: 'jobTitle',
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Job Title',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: dateStartContractController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Date Start Contract',
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                  ),
                  onTap: () {
                    _selectDate('dateStartContract');
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(onPressed: () {
                      userProvider.resetList(true);
                      _form.reset();
                      birthDateRangeController.clear();
                      dateStartContractController.clear();
                    }, child: const Text("RESET")),
                    const SizedBox(
                      width: 15,
                    ),
                    FilledButton(
                        onPressed: () async {
                          userProvider.setFilter(_form);
                          if(mounted) Navigator.of(context).pop();
                        },
                        child: const Text("SEARCH"))
                  ],
                )
              ],
            ),
          )),
    );
  }

  Future<void> _selectDate(String type) async {
    DateTimeRange? dateTimeRange = await showDateRangePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2050));

    if (dateTimeRange != null) {
      switch (type) {
        case 'birth':
          birthDateRangeController.text = '${DateFormat('dd/MM/yyyy').format(dateTimeRange.start)} - ${DateFormat('dd/MM/yyyy').format(dateTimeRange.end)}';
          break;
        case 'dateStartContract':
          dateStartContractController.text = '${DateFormat('dd/MM/yyyy').format(dateTimeRange.start)} - ${DateFormat('dd/MM/yyyy').format(dateTimeRange.end)}';
          break;
      }
      _form.control(type).updateValue(dateTimeRange);
    }
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }
}