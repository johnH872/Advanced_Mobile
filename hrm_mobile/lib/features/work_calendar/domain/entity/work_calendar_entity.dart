// ignore_for_file: non_constant_identifier_names

import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_detail_entity.dart';

class WorkCalendarEntity {
  final int? workCalendarId;
  final String? userId;
  final DateTime? workingDate;
  final int? workingType;
  final double? workingHour;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<WorkCalendarDetailEntity>? WorkCalendarDetails; 
  
  WorkCalendarEntity({
    this.workCalendarId,
    this.userId,
    this.workingDate,
    this.workingType,
    this.workingHour,
    this.createdAt,
    this.updatedAt,
    this.WorkCalendarDetails
  });
}
