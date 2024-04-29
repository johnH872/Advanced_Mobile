// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageModel _$PageModelFromJson(Map<String, dynamic> json) {
  return _PageModel.fromJson(json);
}

/// @nodoc
mixin _$PageModel {
  int? get size => throw _privateConstructorUsedError;
  int? get pageNumber => throw _privateConstructorUsedError;
  int? get totalElement => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  List<FilterMapping>? get filter => throw _privateConstructorUsedError;
  List<String>? get selected => throw _privateConstructorUsedError;
  List<dynamic>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageModelCopyWith<PageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageModelCopyWith<$Res> {
  factory $PageModelCopyWith(PageModel value, $Res Function(PageModel) then) =
      _$PageModelCopyWithImpl<$Res, PageModel>;
  @useResult
  $Res call(
      {int? size,
      int? pageNumber,
      int? totalElement,
      String? userId,
      List<FilterMapping>? filter,
      List<String>? selected,
      List<dynamic>? roles});
}

/// @nodoc
class _$PageModelCopyWithImpl<$Res, $Val extends PageModel>
    implements $PageModelCopyWith<$Res> {
  _$PageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = freezed,
    Object? pageNumber = freezed,
    Object? totalElement = freezed,
    Object? userId = freezed,
    Object? filter = freezed,
    Object? selected = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElement: freezed == totalElement
          ? _value.totalElement
          : totalElement // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<FilterMapping>?,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageModelImplCopyWith<$Res>
    implements $PageModelCopyWith<$Res> {
  factory _$$PageModelImplCopyWith(
          _$PageModelImpl value, $Res Function(_$PageModelImpl) then) =
      __$$PageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? size,
      int? pageNumber,
      int? totalElement,
      String? userId,
      List<FilterMapping>? filter,
      List<String>? selected,
      List<dynamic>? roles});
}

/// @nodoc
class __$$PageModelImplCopyWithImpl<$Res>
    extends _$PageModelCopyWithImpl<$Res, _$PageModelImpl>
    implements _$$PageModelImplCopyWith<$Res> {
  __$$PageModelImplCopyWithImpl(
      _$PageModelImpl _value, $Res Function(_$PageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = freezed,
    Object? pageNumber = freezed,
    Object? totalElement = freezed,
    Object? userId = freezed,
    Object? filter = freezed,
    Object? selected = freezed,
    Object? roles = freezed,
  }) {
    return _then(_$PageModelImpl(
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      totalElement: freezed == totalElement
          ? _value.totalElement
          : totalElement // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      filter: freezed == filter
          ? _value._filter
          : filter // ignore: cast_nullable_to_non_nullable
              as List<FilterMapping>?,
      selected: freezed == selected
          ? _value._selected
          : selected // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageModelImpl implements _PageModel {
  _$PageModelImpl(
      {this.size,
      this.pageNumber,
      this.totalElement,
      this.userId,
      final List<FilterMapping>? filter,
      final List<String>? selected,
      final List<dynamic>? roles})
      : _filter = filter,
        _selected = selected,
        _roles = roles;

  factory _$PageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageModelImplFromJson(json);

  @override
  final int? size;
  @override
  final int? pageNumber;
  @override
  final int? totalElement;
  @override
  final String? userId;
  final List<FilterMapping>? _filter;
  @override
  List<FilterMapping>? get filter {
    final value = _filter;
    if (value == null) return null;
    if (_filter is EqualUnmodifiableListView) return _filter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _selected;
  @override
  List<String>? get selected {
    final value = _selected;
    if (value == null) return null;
    if (_selected is EqualUnmodifiableListView) return _selected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _roles;
  @override
  List<dynamic>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PageModel(size: $size, pageNumber: $pageNumber, totalElement: $totalElement, userId: $userId, filter: $filter, selected: $selected, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageModelImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.totalElement, totalElement) ||
                other.totalElement == totalElement) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._filter, _filter) &&
            const DeepCollectionEquality().equals(other._selected, _selected) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      size,
      pageNumber,
      totalElement,
      userId,
      const DeepCollectionEquality().hash(_filter),
      const DeepCollectionEquality().hash(_selected),
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageModelImplCopyWith<_$PageModelImpl> get copyWith =>
      __$$PageModelImplCopyWithImpl<_$PageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageModelImplToJson(
      this,
    );
  }
}

abstract class _PageModel implements PageModel {
  factory _PageModel(
      {final int? size,
      final int? pageNumber,
      final int? totalElement,
      final String? userId,
      final List<FilterMapping>? filter,
      final List<String>? selected,
      final List<dynamic>? roles}) = _$PageModelImpl;

  factory _PageModel.fromJson(Map<String, dynamic> json) =
      _$PageModelImpl.fromJson;

  @override
  int? get size;
  @override
  int? get pageNumber;
  @override
  int? get totalElement;
  @override
  String? get userId;
  @override
  List<FilterMapping>? get filter;
  @override
  List<String>? get selected;
  @override
  List<dynamic>? get roles;
  @override
  @JsonKey(ignore: true)
  _$$PageModelImplCopyWith<_$PageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
