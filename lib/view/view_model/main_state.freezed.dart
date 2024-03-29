// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MainState _$MainStateFromJson(Map<String, dynamic> json) {
  return _MainState.fromJson(json);
}

/// @nodoc
mixin _$MainState {
  bool get isOpen => throw _privateConstructorUsedError;
  bool get isOrder => throw _privateConstructorUsedError;
  List<bool> get isMenu => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({bool isOpen, bool isOrder, List<bool> isMenu});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? isOrder = null,
    Object? isMenu = null,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrder: null == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isMenu: null == isMenu
          ? _value.isMenu
          : isMenu // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen, bool isOrder, List<bool> isMenu});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? isOrder = null,
    Object? isMenu = null,
  }) {
    return _then(_$MainStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrder: null == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isMenu: null == isMenu
          ? _value._isMenu
          : isMenu // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainStateImpl with DiagnosticableTreeMixin implements _MainState {
  const _$MainStateImpl(
      {this.isOpen = false,
      this.isOrder = false,
      final List<bool> isMenu = const [true, false, false]})
      : _isMenu = isMenu;

  factory _$MainStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isOpen;
  @override
  @JsonKey()
  final bool isOrder;
  final List<bool> _isMenu;
  @override
  @JsonKey()
  List<bool> get isMenu {
    if (_isMenu is EqualUnmodifiableListView) return _isMenu;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isMenu);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainState(isOpen: $isOpen, isOrder: $isOrder, isMenu: $isMenu)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainState'))
      ..add(DiagnosticsProperty('isOpen', isOpen))
      ..add(DiagnosticsProperty('isOrder', isOrder))
      ..add(DiagnosticsProperty('isMenu', isMenu));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isOrder, isOrder) || other.isOrder == isOrder) &&
            const DeepCollectionEquality().equals(other._isMenu, _isMenu));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isOpen, isOrder,
      const DeepCollectionEquality().hash(_isMenu));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainStateImplToJson(
      this,
    );
  }
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final bool isOpen,
      final bool isOrder,
      final List<bool> isMenu}) = _$MainStateImpl;

  factory _MainState.fromJson(Map<String, dynamic> json) =
      _$MainStateImpl.fromJson;

  @override
  bool get isOpen;
  @override
  bool get isOrder;
  @override
  List<bool> get isMenu;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
