import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_range_model.freezed.dart';
part 'date_range_model.g.dart';

@freezed
class DateRangeModel with _$DateRangeModel {
  const factory DateRangeModel({
    DateTime? start,
    DateTime? end
  }) = _DateRangeModel;

  factory DateRangeModel.fromJson(
    Map<String, dynamic> json
  ) => _$DateRangeModelFromJson(json);
}
