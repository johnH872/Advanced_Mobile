// ignore_for_file: empty_catches

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/constants/enums.dart';
import 'package:hrm_mobile/core/models/date_range_model.dart';
import 'package:hrm_mobile/core/models/filter_mapping.dart';
import 'package:hrm_mobile/core/models/page_model.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';
import 'package:hrm_mobile/features/informations/domain/repository/employee_repository.dart';
import 'package:hrm_mobile/features/informations/domain/repository/media_repository.dart';
import 'package:hrm_mobile/injection_container.dart';
import 'package:reactive_forms/reactive_forms.dart';

class UserProvider with ChangeNotifier {
  final EmployeeRepository employeeRepository = sl<EmployeeRepository>();
  final MediaRepository mediaRepository = sl<MediaRepository>();

  List<UserEntity>? _userList = [];
  List<UserEntity>? get userLst => _userList;
  bool isLoading = false;
  bool isSaving = false;
  UserEntity? loggedInUser = UserEntity();
  UserEntity? currentUser = UserEntity();
  PageModel? page = PageModel(size: 15, pageNumber: 0);
  bool isFirstLoading = true;
  bool isMaxOfList = false;
  bool isUploadingImage = false;

  void resetList(value) {
    isFirstLoading = value;
    page = page?.copyWith(size: 15, pageNumber: 0, filter: []);
    _userList = [];
    isMaxOfList = false;
  }

  void setFilter(FormGroup form) async {
    resetList(true);
    Map<String, dynamic> allFilter = form.value;
    List<FilterMapping> filters = [];
    allFilter.forEach((key, value) { 
      if(value != null) {
        switch (key) {
          case 'birth':
          case 'dateStartContract':
            filters.add(FilterMapping(filterType: FilterType.dateRange, operator: FilterOperator.contains, prop: key, dateRange: DateRangeModel(start: value.start, end: value.end)));
            break;
          case 'employeeName':
            filters.add(FilterMapping(filterType: FilterType.custom, operator: FilterOperator.substring, prop: key, value: value));
            break;
          default:
            filters.add(FilterMapping(filterType: FilterType.text, operator: FilterOperator.substring, prop: key, value: value));
            break;
        }
      }
    });
    page = page?.copyWith(size: page?.size ?? 15, pageNumber: page?.pageNumber ?? 0, filter: filters);
    await getEmployeePaging();
    notifyListeners();
  }

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
      if(isMaxOfList) return;
      isLoading = true;
      int currentPage = page?.pageNumber ?? 0;
      var reqPage = page?.copyWith(size: 15, pageNumber: isFirstLoading ? currentPage : currentPage + 1) ?? PageModel(size: 15, pageNumber: 0);
      page = reqPage.copyWith();
      final response = await employeeRepository.getEmployeePaging(reqPage);
      
      // await Future.delayed(const Duration(seconds: 3));
      
      if (response.error != null) {
        _userList = [];
      }
      if (response.data != null && response.data?.result?.data != null) {
        bool isEmptyList = response.data?.result?.data?.isEmpty ?? true;
        if(!isEmptyList) {
          if (isFirstLoading) {
            _userList = response.data!.result!.data;
          } else {
            _userList = [...?_userList, ...?response.data!.result!.data];
          }
          isFirstLoading = false;
        } else {
          isMaxOfList = true;
        }
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

  Future<void> uploadProfileAvatar(File image, BuildContext context) async {
    try {
      isUploadingImage = true;
      notifyListeners();
      final response = await mediaRepository.uploadProfileAvatar(loggedInUser?.userId ?? "", image);
      if (response.error != null) {
        if(context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed")));
      }
      if (response.data != null) {
        loggedInUser = response.data?.result ?? loggedInUser;
        if(context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Succeed")));
      }
    } catch (e) {}
    isUploadingImage = false;
    notifyListeners();
  }
}
