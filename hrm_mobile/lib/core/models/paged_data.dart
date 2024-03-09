import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/core/models/page_model.dart';

part 'paged_data.freezed.dart';
part 'paged_data.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class PagedData<T> with _$PagedData<T> {
  const factory PagedData({
    PageModel? page,
    T? data
  }) = _PagedData;

  factory PagedData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$PagedDataFromJson(json, fromJsonT);
  }
}
