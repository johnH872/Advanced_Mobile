import 'package:flutter/material.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_detail_entity.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_entity.dart';

abstract class WorkCalendarRepository {
  Future<DataState<ServiceResponse<List<WorkCalendarEntity>>>> getWorkCalendarByUserId(List<String> userId, DateTimeRange dateRangeModel);
  Future<DataState<ServiceResponse<WorkCalendarEntity>>> saveWorkCalendar(WorkCalendarEntity workCalendarEntity);
  Future<DataState<ServiceResponse<WorkCalendarDetailEntity>>> saveWorkCalendarDetail(WorkCalendarDetailEntity workCalendarDetailEntity);
  Future<DataState<ServiceResponse<bool>>> removeWorkCalendarDetails(List<int> ids);
}
