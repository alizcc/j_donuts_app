// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  priceMmk: (json['priceMmk'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  description: json['description'] as String,
  isNew: json['isNew'] as bool? ?? false,
  discountPercent: (json['discountPercent'] as num?)?.toInt(),
  imageAsset: json['imageAsset'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'priceMmk': instance.priceMmk,
  'imageUrl': instance.imageUrl,
  'description': instance.description,
  'isNew': instance.isNew,
  'discountPercent': instance.discountPercent,
  'imageAsset': instance.imageAsset,
};
