// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/features/leave/domain/entity/datastate_entity.dart';
part 'datastate_model.freezed.dart';
part 'datastate_model.g.dart';

@freezed
class DataStateModel extends DataStateEntity with _$DataStateModel {
  const factory DataStateModel({
    int? dataStateId,
    String? dataStateName,
    String? type,
    String? colorCode,
    int? order,
  }) = _DataStateModel;

  factory DataStateModel.fromJson(Map<String, Object?> json) => _$DataStateModelFromJson(json);

  factory DataStateModel.fromEntity(DataStateEntity entity) {
    return DataStateModel(
        dataStateId: entity.dataStateId,
        dataStateName: entity.dataStateName,
        type: entity.type,
        colorCode: entity.colorCode,
        order: entity.order);
  }
}
