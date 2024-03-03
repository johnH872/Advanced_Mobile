import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/widgets/app_bar_widget.dart';
import 'package:hrm_mobile/features/informations/presentation/pages/employee_detail_screen.dart';
import 'package:hrm_mobile/features/informations/presentation/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ListEmployeeScreen extends StatefulWidget {
  const ListEmployeeScreen({super.key});

  @override
  State<ListEmployeeScreen> createState() => _ListEmployeeScreenState();
}

class _ListEmployeeScreenState extends State<ListEmployeeScreen> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<void> initData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.getEmployeePaging();
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
            )),
        body: userProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userProvider.userLst!.length,
                itemBuilder: (_, index) {
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
                },
              ));
  }
}
