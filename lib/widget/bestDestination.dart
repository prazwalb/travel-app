class Bestdestination {
  String id;
  String name;
  String description;
  double rating;
  String imageUrl;
  String location;

  Bestdestination({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.location,
  });

  factory Bestdestination.fromJson(Map<String, dynamic> json) =>
      Bestdestination(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        imageUrl: json["image_url"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rating": rating,
        "image_url": imageUrl,
        "location": location,
      };
}
