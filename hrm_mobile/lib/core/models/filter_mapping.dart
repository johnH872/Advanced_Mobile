import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/core/constants/enums.dart';
import 'package:hrm_mobile/core/models/date_range_model.dart';

part 'filter_mapping.freezed.dart';
part 'filter_mapping.g.dart';

@freezed
class FilterMapping with _$FilterMapping {
  const factory FilterMapping({
    FilterType? filterType,
    String? value,
    String? prop,
    DateRangeModel? dateRange,
    FilterOperator? operator
  }) = _FilterMapping;

  factory FilterMapping.fromJson(
    Map<String, dynamic> json
  ) =>_$FilterMappingFromJson(json);
}
