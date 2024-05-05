// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/work_calendar/data/models/work_calendar_detail_model.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';
part 'work_calendars_model.freezed.dart';
part 'work_calendars_model.g.dart';

@freezed
class WorkCalendarsModel extends WorkCalendarEntity with _$WorkCalendarsModel {
  const factory WorkCalendarsModel({
    int? workCalendarId,
    String? userId,
    DateTime? workingDate,
    int? workingType,
    double? workingHour,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<WorkCalendarDetailModel>? WorkCalendarDetails, 
  }) = _WorkCalendarsModel;

  factory WorkCalendarsModel.fromJson(Map<String, Object?> json) => _$WorkCalendarsModelFromJson(json);

  factory WorkCalendarsModel.fromEntity(WorkCalendarEntity entity) {
    return WorkCalendarsModel(
      workCalendarId: entity.workCalendarId,
      userId: entity.userId,
      workingDate: entity.workingDate,
      workingType: entity.workingType,
      workingHour: entity.workingHour,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
