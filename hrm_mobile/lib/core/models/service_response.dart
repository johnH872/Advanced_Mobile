import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_response.freezed.dart';
part 'service_response.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class ServiceResponse<T> with _$ServiceResponse<T> {
  const factory ServiceResponse({
    String? message,
    T? result,
  }) = _ServiceResponse;

  factory ServiceResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$ServiceResponseFromJson<T>(json, fromJsonT);
  }
}
