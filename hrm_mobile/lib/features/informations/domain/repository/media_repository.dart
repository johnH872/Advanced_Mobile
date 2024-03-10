import 'dart:io';

import 'package:hrm_mobile/core/models/service_response.dart';
import 'package:hrm_mobile/core/resources/data_states.dart';
import 'package:hrm_mobile/features/informations/data/models/user_model.dart';

abstract class MediaRepository {
  Future<DataState<ServiceResponse<UserModel>>> uploadProfileAvatar(String userId, File image);
}