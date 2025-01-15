import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> fetchpost() async {
  final res =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  // print(res.body);
  // print(res.statusCode);
  final decodebody = jsonDecode(res.body);
  print(decodebody[3]['title']);

  // final firstpost = jsonDecode(res.body);
  // print(firstpost[0]['title']);

  final firstpost = Post.fromJson(decodebody[3]);
  print(firstpost.title);
  print(firstpost.body);
  final post = postFunction(res.body);
  for (int i = 0; i < post.length; i++) {
    print(post[i].id);
  }
}

List<Post> postFunction(String nonDecodedcode) {
  List<Post> posts = [];
  final decodedcode = jsonDecode(nonDecodedcode);
  for (var i = 0; i < decodedcode.length; i++) {
    posts.add(Post.fromJson(decodedcode[i]));
  }
  return posts;
}

Future<Post> getSinglePost(String postid) async {
  final ress = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postid'));

  // print(ress.body);
  final singledecode = jsonDecode(ress.body);
  // print(singledecode.runtimeType);
  return Post.fromJson(singledecode);
}

Future<List<Comments>> getPostComments(String commentId) async {
  final res = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/posts/$commentId/comments'));
  List<Comments> commentslist = [];
  final decodedcomments = jsonDecode(res.body);
  print(decodedcomments.runtimeType);
  for (var i = 0; i < decodedcomments.length; i++) {
    commentslist.add(Comments.fromJson(decodedcomments[i]));
  }
  return commentslist;
}

Future<List<Comments>> getByPostId(String postId) async {
  final res = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/comments?postId=$postId'));
  // final postcom = Comments;
  List<Comments> commentpostId = [];
  final decodedpost = jsonDecode(res.body);
  // print(decodedpost.runtimeType);
  for (var i = 0; i < decodedpost.length; i++) {
    commentpostId.add(Comments.fromJson(decodedpost[i]));
  }
  return commentpostId;
}

Future<void> sendPost(Post post) async {
  final res = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: jsonEncode(post.toJson()),
      headers: {'content-type': 'application/json'});

  print(res.body);
}

Future<void> editPost(Post put) async {
  final res =
      await http.put(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
          body: jsonEncode({
            'id': 1,
            'title': 'foo',
            'body': 'bar',
            'userId': 1,
          }),
          headers: {'content-type': 'application/json; character-set=UTF-8'});
  print(res.body);
  print(res.statusCode);
}

Future<void> postPach() async {
  final res = await http
      .patch(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
          body: jsonEncode({
            'title': 'patched',
            'body': 'it hase been edited',
          }),
          headers: {
        'Content-type': 'application/json; charset=UTF-8',
      });

  print(res.statusCode);
}

Future<void> deleteFunction(String postId) async {
  final res = await http
      .delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));
  print(res.statusCode);
}

void main() async {
  // return await fetchpost();
  // final post2 = await getSinglePost('2');
  // final post3 = await getSinglePost('3');

  // final comment = await getPostComments('2');

  // print(post2.title);
  // print(post3.title);

  // for (var i = 0; i < comment.length; i++) {
  //   print(comment[i].email);
  // }
  // final commentid = await getPostComments(2.toString());
  // for (var i = 0; i < commentid.length; i++) {
  //   print(commentid[i].id);
  // }

  await sendPost(Post(userId: 1, id: 2, body: 'body', title: 'title'));
  final putmethod = await editPost(
      Post(userId: 1, id: 2, body: 'smdfbkgjbdfg', title: 'prazwal'));
  final patchmethod = await postPach();

  final deletepost = deleteFunction('2');
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.body,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      body: json['body'],
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'userid': userId,
    };
  }
}

class Comments {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comments({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
