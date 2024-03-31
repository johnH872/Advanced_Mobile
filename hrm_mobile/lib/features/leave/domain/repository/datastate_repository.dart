

import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/leave/domain/entity/datastate_entity.dart';

abstract class DataStateRepository {
  Future<DataState<ServiceResponse<List<DataStateEntity>>>> getDataStateByType(String type);
  Future<DataState<ServiceResponse<DataStateEntity>>> getDataStateByTypeAndName(String type, String name);
}