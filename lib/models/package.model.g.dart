// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageModelImpl _$$PackageModelImplFromJson(Map<String, dynamic> json) =>
    _$PackageModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      tests: (json['tests'] as List<dynamic>)
          .map((e) => TestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      durationInHours: json['durationInHours'] as int,
      price: json['price'] as int,
      discountedPrice: json['discountedPrice'] as int? ?? 0,
      hasDiscount: json['hasDiscount'] as bool? ?? false,
    );

Map<String, dynamic> _$$PackageModelImplToJson(_$PackageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tests': instance.tests,
      'durationInHours': instance.durationInHours,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'hasDiscount': instance.hasDiscount,
    };
