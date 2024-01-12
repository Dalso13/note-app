// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainStateImpl _$$MainStateImplFromJson(Map<String, dynamic> json) =>
    _$MainStateImpl(
      isOpen: json['isOpen'] as bool? ?? false,
      isOrder: json['isOrder'] as bool? ?? false,
      isMenu:
          (json['isMenu'] as List<dynamic>?)?.map((e) => e as bool).toList() ??
              const [true, false, false],
    );

Map<String, dynamic> _$$MainStateImplToJson(_$MainStateImpl instance) =>
    <String, dynamic>{
      'isOpen': instance.isOpen,
      'isOrder': instance.isOrder,
      'isMenu': instance.isMenu,
    };
