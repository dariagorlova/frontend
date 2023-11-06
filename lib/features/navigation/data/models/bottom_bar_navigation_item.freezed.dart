// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_bar_navigation_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomBarNavItemModel {
  String get icon => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomBarNavItemModelCopyWith<BottomBarNavItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomBarNavItemModelCopyWith<$Res> {
  factory $BottomBarNavItemModelCopyWith(BottomBarNavItemModel value,
          $Res Function(BottomBarNavItemModel) then) =
      _$BottomBarNavItemModelCopyWithImpl<$Res, BottomBarNavItemModel>;
  @useResult
  $Res call({String icon, String label, String route, bool isSelected});
}

/// @nodoc
class _$BottomBarNavItemModelCopyWithImpl<$Res,
        $Val extends BottomBarNavItemModel>
    implements $BottomBarNavItemModelCopyWith<$Res> {
  _$BottomBarNavItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? label = null,
    Object? route = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomBarNavItemModelImplCopyWith<$Res>
    implements $BottomBarNavItemModelCopyWith<$Res> {
  factory _$$BottomBarNavItemModelImplCopyWith(
          _$BottomBarNavItemModelImpl value,
          $Res Function(_$BottomBarNavItemModelImpl) then) =
      __$$BottomBarNavItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String icon, String label, String route, bool isSelected});
}

/// @nodoc
class __$$BottomBarNavItemModelImplCopyWithImpl<$Res>
    extends _$BottomBarNavItemModelCopyWithImpl<$Res,
        _$BottomBarNavItemModelImpl>
    implements _$$BottomBarNavItemModelImplCopyWith<$Res> {
  __$$BottomBarNavItemModelImplCopyWithImpl(_$BottomBarNavItemModelImpl _value,
      $Res Function(_$BottomBarNavItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? label = null,
    Object? route = null,
    Object? isSelected = null,
  }) {
    return _then(_$BottomBarNavItemModelImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BottomBarNavItemModelImpl implements _BottomBarNavItemModel {
  const _$BottomBarNavItemModelImpl(
      {required this.icon,
      required this.label,
      required this.route,
      this.isSelected = false});

  @override
  final String icon;
  @override
  final String label;
  @override
  final String route;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'BottomBarNavItemModel(icon: $icon, label: $label, route: $route, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarNavItemModelImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, icon, label, route, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarNavItemModelImplCopyWith<_$BottomBarNavItemModelImpl>
      get copyWith => __$$BottomBarNavItemModelImplCopyWithImpl<
          _$BottomBarNavItemModelImpl>(this, _$identity);
}

abstract class _BottomBarNavItemModel implements BottomBarNavItemModel {
  const factory _BottomBarNavItemModel(
      {required final String icon,
      required final String label,
      required final String route,
      final bool isSelected}) = _$BottomBarNavItemModelImpl;

  @override
  String get icon;
  @override
  String get label;
  @override
  String get route;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$BottomBarNavItemModelImplCopyWith<_$BottomBarNavItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
