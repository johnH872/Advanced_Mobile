import 'package:hrm_mobile/core/models/page_model.dart';
import 'package:hrm_mobile/core/models/paged_data.dart';
import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/informations/domain/entity/user_entity.dart';

abstract class EmployeeRepository {
  Future<DataState<ServiceResponse<PagedData<List<UserEntity>>>>> getEmployeePaging(PageModel page);
  Future<DataState<ServiceResponse<UserEntity>>> getEmployeeById(String id);
  Future<DataState<ServiceResponse<UserEntity>>> saveEmployee(UserEntity userEntity);
}