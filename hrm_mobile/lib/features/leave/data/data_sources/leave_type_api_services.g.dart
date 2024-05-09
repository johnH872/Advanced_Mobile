// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LeaveTypeApiService implements LeaveTypeApiService {
  _LeaveTypeApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://10.0.2.2:5000/api/LeaveTypeManagement/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<ServiceResponse<List<LeaveTypeModel>>>>
      getAllLeaveType() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ServiceResponse<List<LeaveTypeModel>>>>(
            Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'GetAllLeaveType',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = ServiceResponse<List<LeaveTypeModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<LeaveTypeModel>(
                  (i) => LeaveTypeModel.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ServiceResponse<LeaveTypeModel>>> saveLeaveType(
      Map<String, dynamic> leaveRequestJson) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(leaveRequestJson);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ServiceResponse<LeaveTypeModel>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'SaveLeaveType',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ServiceResponse<LeaveTypeModel>.fromJson(
      _result.data!,
      (json) => LeaveTypeModel.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
