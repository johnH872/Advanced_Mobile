import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/work_calendar/domain/entity/setting_entity.dart';

abstract class SettingRepository {
  Future<DataState<ServiceResponse<SettingEntity>>> getSettingByKeyAndGroup(String key, String group);
  Future<DataState<ServiceResponse<List<SettingEntity>>>> getSettingByGroup(String group);
  Future<DataState<ServiceResponse<List<SettingEntity>>>> getAllSetting();
}
