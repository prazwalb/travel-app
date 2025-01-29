// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bestdestination _$BestdestinationFromJson(Map<String, dynamic> json) =>
    Bestdestination(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      location: json['location'] as String,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BestdestinationToJson(Bestdestination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
      'location': instance.location,
      'price': instance.price,
    };
