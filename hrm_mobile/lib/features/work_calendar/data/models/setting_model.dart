import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/setting_entity.dart';
part 'setting_model.freezed.dart';
part 'setting_model.g.dart';

@freezed
class SettingModel extends SettingEntity with _$SettingModel {
  const factory SettingModel({
    String? key,
    String? group,
    String? value,
  }) = _SettingModel;

  factory SettingModel.fromJson(Map<String, Object?> json) => _$SettingModelFromJson(json);

  factory SettingModel.fromEntity(SettingEntity entity) {
    return SettingModel(
      key: entity.key,
      group: entity.group,
      value: entity.value,
    );
  }
}
