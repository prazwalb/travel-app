import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photos extends StatelessWidget {
  const Photos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Post.getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                );
              },
              itemCount: 100,
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// void main() async {
//   final photo = await getPhotos();
//   for (var i = 0; i < photo.length; i++) {
//     print(photo[i].title);
//   }
// }

// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Post({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };

  static Future<List<Post>> getPhotos() async {
    final res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final decodedphoto = await jsonDecode(res.body);
    List<Post> photos = [];
    for (var i = 0; i < decodedphoto.length; i++) {
      photos.add(Post.fromJson(decodedphoto[i]));
    }
    return photos;
  }
}
