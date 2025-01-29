import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

@JsonSerializable()
class Bestdestination {
  @JsonKey(name: '_id', includeToJson: false)
  String id;
  String name;
  String description;
  double rating;
  String imageUrl;
  String location;
  int? price;

  Bestdestination({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.location,
    this.price,
  });

  factory Bestdestination.fromJson(Map<String, dynamic> json) =>
      _$BestdestinationFromJson(json);

  Map<String, dynamic> toJson() => _$BestdestinationToJson(this);
}
