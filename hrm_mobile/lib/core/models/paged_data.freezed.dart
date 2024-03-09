// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PagedData<T> {
  PageModel? get page => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagedDataCopyWith<T, PagedData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedDataCopyWith<T, $Res> {
  factory $PagedDataCopyWith(
          PagedData<T> value, $Res Function(PagedData<T>) then) =
      _$PagedDataCopyWithImpl<T, $Res, PagedData<T>>;
  @useResult
  $Res call({PageModel? page, T? data});

  $PageModelCopyWith<$Res>? get page;
}

/// @nodoc
class _$PagedDataCopyWithImpl<T, $Res, $Val extends PagedData<T>>
    implements $PagedDataCopyWith<T, $Res> {
  _$PagedDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PageModel?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageModelCopyWith<$Res>? get page {
    if (_value.page == null) {
      return null;
    }

    return $PageModelCopyWith<$Res>(_value.page!, (value) {
      return _then(_value.copyWith(page: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PagedDataImplCopyWith<T, $Res>
    implements $PagedDataCopyWith<T, $Res> {
  factory _$$PagedDataImplCopyWith(
          _$PagedDataImpl<T> value, $Res Function(_$PagedDataImpl<T>) then) =
      __$$PagedDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({PageModel? page, T? data});

  @override
  $PageModelCopyWith<$Res>? get page;
}

/// @nodoc
class __$$PagedDataImplCopyWithImpl<T, $Res>
    extends _$PagedDataCopyWithImpl<T, $Res, _$PagedDataImpl<T>>
    implements _$$PagedDataImplCopyWith<T, $Res> {
  __$$PagedDataImplCopyWithImpl(
      _$PagedDataImpl<T> _value, $Res Function(_$PagedDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PagedDataImpl<T>(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PageModel?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$PagedDataImpl<T> implements _PagedData<T> {
  const _$PagedDataImpl({this.page, this.data});

  @override
  final PageModel? page;
  @override
  final T? data;

  @override
  String toString() {
    return 'PagedData<$T>(page: $page, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedDataImpl<T> &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, page, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedDataImplCopyWith<T, _$PagedDataImpl<T>> get copyWith =>
      __$$PagedDataImplCopyWithImpl<T, _$PagedDataImpl<T>>(this, _$identity);
}

abstract class _PagedData<T> implements PagedData<T> {
  const factory _PagedData({final PageModel? page, final T? data}) =
      _$PagedDataImpl<T>;

  @override
  PageModel? get page;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$PagedDataImplCopyWith<T, _$PagedDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
