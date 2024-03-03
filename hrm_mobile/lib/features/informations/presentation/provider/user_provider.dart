// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';
import 'package:hrm_mobile/features/informations/domain/repository/employee_repository.dart';
import 'package:hrm_mobile/injection_container.dart';

class UserProvider with ChangeNotifier {
  final EmployeeRepository employeeRepository = sl<EmployeeRepository>();
  List<UserEntity>? _userList = [];
  List<UserEntity>? get userLst => _userList;
  bool isLoading = false;
  bool isSaving = false;
  UserEntity? loggedInUser;
  UserEntity? currentUser;

  Future<void> getUserById(bool isMyProfile, String? userId) async {
    try {
      isLoading = true;
      final response = await employeeRepository.getEmployeeById(userId ?? "");
      if (response.data != null) {
       isMyProfile ? loggedInUser = response.data!.result : currentUser = response.data!.result;
      }
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }

  Future<void> getEmployeePaging() async {
    try {
      isLoading = true;
      final response = await employeeRepository.getEmployeePaging();
      if (response.error != null) {
        _userList = [];
      }
      if (response.data != null) {
        _userList = response.data?.result;
      }
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }

  Future<bool> saveEmployee(UserEntity userEntity, bool isMyProfile) async {
    var result = true;
    try {
      isSaving = true;
      final response = await employeeRepository.saveEmployee(userEntity);
      if (response.error != null) {
        result = false;
      }
      if (response.data != null) {
        isMyProfile ? loggedInUser = userEntity : currentUser = userEntity;
        result = true;
      }
    } catch (e) {}
    isSaving = false;
    notifyListeners();
    return result;
  }
}
