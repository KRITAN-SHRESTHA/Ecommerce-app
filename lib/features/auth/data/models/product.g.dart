// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  json['description'] as String,
  json['name'] as String,
  json['price'] as String,
  json['rating'] as String,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'name': instance.name,
  'price': instance.price,
  'description': instance.description,
  'rating': instance.rating,
};
