// ignore_for_file: empty_catches, avoid_print

import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/constants/constants.dart';
import 'package:hrm_mobile/core/util/payload_util.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_etitlement_entity.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_request_entity.dart';
import 'package:hrm_mobile/features/leave/domain/entity/leave_type_entity.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_entitlement_repository.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_request_repository.dart';
import 'package:hrm_mobile/features/leave/domain/repository/leave_type_repository.dart';
import 'package:hrm_mobile/injection_container.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LeaveProvider with ChangeNotifier {
  final LeaveTypeRepository leaveTypeRepo = sl<LeaveTypeRepository>();
  final LeaveRequestRepository leaveRequestRepo = sl<LeaveRequestRepository>();
  final LeaveEntitlementRepository leaveEntitlementRepo = sl<LeaveEntitlementRepository>();

  List<LeaveTypeEntity> _listLeaveType = [];
  List<LeaveTypeEntity> get listLeaveType => _listLeaveType;

  List<LeaveEntitlementEntity> _myListLeaveEntilement = [];
  List<LeaveEntitlementEntity> get myListLeaveEntilement => _myListLeaveEntilement;

  List<LeaveRequestEntity> _myListLeaveRequest = [];
  List<LeaveRequestEntity> get myListLeaveRequest => _myListLeaveRequest;

  // UI Data
  LeaveRequestEntity leaveRequestEntity = LeaveRequestEntity();
  String leaveTypeName = "No available";
  List<String> availableListTypeNames = [];
  List<int> availableListTypeIds = [];
  final PayloadUtil payloadUtil = PayloadUtil();

  List<double> remainLeaves = List.generate(4, (index) => 0);

  bool isSaving = false;
  String userId = "";

  void setUpInitProviderData(LeaveRequestEntity? leaveRequestEntityInput) {
    var currentDate = DateTime.now();
    if (leaveRequestEntityInput == null) {
      leaveRequestEntity.leaveRequestId = null;
      leaveRequestEntity.leaveDateFrom = DateTime(currentDate.year, currentDate.month, currentDate.day, 8, 30);
      leaveRequestEntity.leaveDateTo = DateTime(currentDate.year, currentDate.month, currentDate.day, 17, 30);
      leaveRequestEntity.userId = userId;
      leaveRequestEntity.session = leaveSessions.keys.first;
      leaveRequestEntity.numberOfHour = leaveSessions[leaveSessions.keys.first];
      leaveRequestEntity.leaveEntitlementId = null;
      leaveRequestEntity.note = null;
      leaveRequestEntity.reason = null;
    } else {
      leaveRequestEntity.leaveRequestId = leaveRequestEntityInput.leaveRequestId;
      leaveRequestEntity.leaveDateFrom = leaveRequestEntityInput.leaveDateFrom!.toLocal();
      leaveRequestEntity.leaveDateTo = leaveRequestEntityInput.leaveDateTo!.toLocal();
      leaveRequestEntity.userId = leaveRequestEntityInput.userId;
      leaveRequestEntity.session = leaveSessions.keys.first;
      leaveRequestEntity.numberOfHour = leaveSessions[leaveSessions.keys.first];
      leaveRequestEntity.leaveEntitlementId = leaveRequestEntityInput.leaveEntitlementId;
      leaveRequestEntity.note = leaveRequestEntityInput.note;
      leaveRequestEntity.reason = leaveRequestEntityInput.reason;
    }
  }

  Future<void> setUpData(UserEntity? userEntity, BuildContext? context) async {
    if (context != null && context.mounted) context.loaderOverlay.show();
    try {
      // Handle for assign leave request or submit leave request
      if (userEntity != null) {
        userId = userEntity.userId ?? userId;
      } else {
        userId = await payloadUtil.getUserId();
      }

      leaveRequestEntity.userId = userId;
      await getAllLeaveType();
      await getLeaveEntitlementByEmployeeId(userId);

      availableListTypeIds = [];
      availableListTypeNames = [];
      if (_listLeaveType.isNotEmpty && _myListLeaveEntilement.isNotEmpty) {
        for (var leaveEntitlement in _myListLeaveEntilement) {
          if (leaveEntitlement.usableLeave! > 0) {
            availableListTypeIds.add(leaveEntitlement.leaveTypeId ?? 0);
            availableListTypeNames.add(_listLeaveType
                    .where((element) => element.leaveTypeId == leaveEntitlement.leaveTypeId)
                    .first
                    .leaveTypeName ??
                "");
          }
        }
      }

      // Update UI data
      if (availableListTypeIds.isNotEmpty) {
        leaveRequestEntity.leaveEntitlementId = _myListLeaveEntilement[0].leaveEntitlementId;
        leaveTypeName = availableListTypeNames[0];
      }
    } catch (e) {
      print(e);
    }
    if (context != null && context.mounted) context.loaderOverlay.hide();
    notifyListeners();
  }

  Future<void> getAllLeaveType() async {
    try {
      final response = await leaveTypeRepo.getAllLeaveType();
      if (response.data != null) {
        _listLeaveType = response.data?.result ?? [];
      }
    } catch (e) {
      print(e);
    }
    // notifyListeners();
  }

  Future<void> getLeaveEntitlementByEmployeeId(String userId) async {
    try {
      final response = await leaveEntitlementRepo.getLeaveEntitlementByEmployeeId(userId);
      if (response.data != null) {
        _myListLeaveEntilement = response.data?.result ?? [];
        for (var i = 0; i < _myListLeaveEntilement.length; i++) {
          if (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Annually').firstOrNull != null) {
                remainLeaves[0] = 
                _myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Annually').firstOrNull?.usableLeave ?? 0.0 - 
                (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Annually').firstOrNull?.usedLeave ?? 0.0);
          }

          if (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Seniority').firstOrNull != null) {
                remainLeaves[1] = 
                _myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Seniority').firstOrNull?.usableLeave ?? 0.0 - 
                (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Seniority').firstOrNull?.usedLeave ?? 0.0);
          }

          if (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Transfer').firstOrNull != null) {
                remainLeaves[2] = 
                _myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Transfer').firstOrNull?.usableLeave ?? 0.0 - 
                (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'Transfer').firstOrNull?.usedLeave ?? 0.0);
          }

          if (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'UnPaid').firstOrNull != null) {
                remainLeaves[3] = 
                _myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'UnPaid').firstOrNull?.usableLeave ?? 0.0 - 
                (_myListLeaveEntilement.where((element) => element.LeaveType?.leaveTypeName == 'UnPaid').firstOrNull?.usedLeave ?? 0.0);
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveLeaveRequest(BuildContext context) async {
    isSaving = true;
    notifyListeners();
    try {
      final response = await leaveRequestRepo.saveLeaveRequest(leaveRequestEntity);
      if (response.error != null) {
        if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed!")));
      }
      if (response.data != null) {
        if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success!")));
      }
    } catch (e) {
      print(e);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<void> getLeaveRequestByEmployeeId(BuildContext context) async {
    context.loaderOverlay.show();
    try {
      userId = await payloadUtil.getUserId();
      final response = await leaveRequestRepo.getLeaveRequestByEmployeeId(userId);
      if (response.data != null) {
        _myListLeaveRequest = response.data?.result ?? [];
      }
    } catch (e) {
      print(e);
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
  }

  Future<void> getLeaveRequestByFilter(BuildContext context, DateTimeRange? dateTimeRange) async {
    context.loaderOverlay.show();
    try {
      userId = await payloadUtil.getUserId();
      if (dateTimeRange != null) {
        final response = await leaveRequestRepo.getLeaveRequestByFilter(userId, dateTimeRange);
        if (response.data != null) {
          _myListLeaveRequest = response.data?.result ?? [];
        }
      }
    } catch (e) {
      print(e);
    }
    if (context.mounted) context.loaderOverlay.hide();
    notifyListeners();
  }

  notifyChanges() {
    notifyListeners();
  }
}
