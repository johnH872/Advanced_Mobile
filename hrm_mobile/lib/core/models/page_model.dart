import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrm_mobile/core/models/filter_mapping.dart';

part 'page_model.freezed.dart';
part 'page_model.g.dart';

@freezed
abstract class PageModel with _$PageModel {
  factory PageModel({
    int? size,
    int? pageNumber,
    int? totalElement,
    String? userId,
    List<FilterMapping>? filter,
    List<String>? selected,
    List<dynamic>? roles,
  }) = _PageModel;

  factory PageModel.fromJson(Map<String, Object?> json)
        => _$PageModelFromJson(json);
}
