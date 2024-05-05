import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/work_calendar_detail_entity.dart';
part 'work_calendar_detail_model.freezed.dart';
part 'work_calendar_detail_model.g.dart';

@freezed
class WorkCalendarDetailModel extends WorkCalendarDetailEntity with _$WorkCalendarDetailModel {
  const factory WorkCalendarDetailModel({
    int? workCalendarDetailId,
    int? workCalendarId,
    String? from,
    String? to,
    String? description,
    String? codeColor,
    String? createdAt,
    DateTime? updatedAt, 
  }) = _WorkCalendarDetailModel;

  factory WorkCalendarDetailModel.fromJson(Map<String, Object?> json) => _$WorkCalendarDetailModelFromJson(json);

  factory WorkCalendarDetailModel.fromEntity(WorkCalendarDetailEntity entity) {
    return WorkCalendarDetailModel(
      workCalendarDetailId: entity.workCalendarDetailId,
      workCalendarId: entity.workCalendarId,
      from: entity.from,
      to: entity.to,
      description: entity.description,
      codeColor: entity.codeColor,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
