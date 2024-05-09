// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_entitlement_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LeaveEntitlementApiService implements LeaveEntitlementApiService {
  _LeaveEntitlementApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://10.0.2.2:5000/api/LeaveEntitlementManagement/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<ServiceResponse<List<LeaveEntitlementModel>>>>
      getAllLeaveEntitlement() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<ServiceResponse<List<LeaveEntitlementModel>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'GetAllLeaveEntitlement',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = ServiceResponse<List<LeaveEntitlementModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<LeaveEntitlementModel>((i) =>
                  LeaveEntitlementModel.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ServiceResponse<LeaveEntitlementModel>>>
      saveLeaveEntitlement(Map<String, dynamic> leaveEntitlementJson) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(leaveEntitlementJson);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ServiceResponse<LeaveEntitlementModel>>>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'SaveLeaveEntitlement',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))));
    final value = ServiceResponse<LeaveEntitlementModel>.fromJson(
      _result.data!,
      (json) => LeaveEntitlementModel.fromJson(json as Map<String, dynamic>),
    );
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<ServiceResponse<List<LeaveEntitlementModel>>>>
      getLeaveEntitlementByEmployeeId(String employeeId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'employeeId': employeeId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        HttpResponse<ServiceResponse<List<LeaveEntitlementModel>>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'GetLeaveEntitlementByEmployeeId',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
    final value = ServiceResponse<List<LeaveEntitlementModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<LeaveEntitlementModel>((i) =>
                  LeaveEntitlementModel.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
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
