// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationItem {
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  IconData get selectedIcon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationItemCopyWith<NavigationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationItemCopyWith<$Res> {
  factory $NavigationItemCopyWith(
          NavigationItem value, $Res Function(NavigationItem) then) =
      _$NavigationItemCopyWithImpl<$Res, NavigationItem>;
  @useResult
  $Res call({String label, IconData icon, IconData selectedIcon});
}

/// @nodoc
class _$NavigationItemCopyWithImpl<$Res, $Val extends NavigationItem>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavigationItemCopyWith<$Res>
    implements $NavigationItemCopyWith<$Res> {
  factory _$$_NavigationItemCopyWith(
          _$_NavigationItem value, $Res Function(_$_NavigationItem) then) =
      __$$_NavigationItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, IconData icon, IconData selectedIcon});
}

/// @nodoc
class __$$_NavigationItemCopyWithImpl<$Res>
    extends _$NavigationItemCopyWithImpl<$Res, _$_NavigationItem>
    implements _$$_NavigationItemCopyWith<$Res> {
  __$$_NavigationItemCopyWithImpl(
      _$_NavigationItem _value, $Res Function(_$_NavigationItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = null,
  }) {
    return _then(_$_NavigationItem(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: null == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc

class _$_NavigationItem implements _NavigationItem {
  const _$_NavigationItem(
      {required this.label, required this.icon, required this.selectedIcon});

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final IconData selectedIcon;

  @override
  String toString() {
    return 'NavigationItem(label: $label, icon: $icon, selectedIcon: $selectedIcon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationItem &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, icon, selectedIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavigationItemCopyWith<_$_NavigationItem> get copyWith =>
      __$$_NavigationItemCopyWithImpl<_$_NavigationItem>(this, _$identity);
}

abstract class _NavigationItem implements NavigationItem {
  const factory _NavigationItem(
      {required final String label,
      required final IconData icon,
      required final IconData selectedIcon}) = _$_NavigationItem;

  @override
  String get label;
  @override
  IconData get icon;
  @override
  IconData get selectedIcon;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationItemCopyWith<_$_NavigationItem> get copyWith =>
      throw _privateConstructorUsedError;
}
