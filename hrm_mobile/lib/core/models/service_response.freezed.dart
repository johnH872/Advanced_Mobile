// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceResponse<T> {
  String? get message => throw _privateConstructorUsedError;
  T? get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceResponseCopyWith<T, ServiceResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceResponseCopyWith<T, $Res> {
  factory $ServiceResponseCopyWith(
          ServiceResponse<T> value, $Res Function(ServiceResponse<T>) then) =
      _$ServiceResponseCopyWithImpl<T, $Res, ServiceResponse<T>>;
  @useResult
  $Res call({String? message, T? result});
}

/// @nodoc
class _$ServiceResponseCopyWithImpl<T, $Res, $Val extends ServiceResponse<T>>
    implements $ServiceResponseCopyWith<T, $Res> {
  _$ServiceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceResponseImplCopyWith<T, $Res>
    implements $ServiceResponseCopyWith<T, $Res> {
  factory _$$ServiceResponseImplCopyWith(_$ServiceResponseImpl<T> value,
          $Res Function(_$ServiceResponseImpl<T>) then) =
      __$$ServiceResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? message, T? result});
}

/// @nodoc
class __$$ServiceResponseImplCopyWithImpl<T, $Res>
    extends _$ServiceResponseCopyWithImpl<T, $Res, _$ServiceResponseImpl<T>>
    implements _$$ServiceResponseImplCopyWith<T, $Res> {
  __$$ServiceResponseImplCopyWithImpl(_$ServiceResponseImpl<T> _value,
      $Res Function(_$ServiceResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? result = freezed,
  }) {
    return _then(_$ServiceResponseImpl<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ServiceResponseImpl<T> implements _ServiceResponse<T> {
  const _$ServiceResponseImpl({this.message, this.result});

  @override
  final String? message;
  @override
  final T? result;

  @override
  String toString() {
    return 'ServiceResponse<$T>(message: $message, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceResponseImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceResponseImplCopyWith<T, _$ServiceResponseImpl<T>> get copyWith =>
      __$$ServiceResponseImplCopyWithImpl<T, _$ServiceResponseImpl<T>>(
          this, _$identity);
}

abstract class _ServiceResponse<T> implements ServiceResponse<T> {
  const factory _ServiceResponse({final String? message, final T? result}) =
      _$ServiceResponseImpl<T>;

  @override
  String? get message;
  @override
  T? get result;
  @override
  @JsonKey(ignore: true)
  _$$ServiceResponseImplCopyWith<T, _$ServiceResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
