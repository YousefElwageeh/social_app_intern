import 'dart:convert';

class Post {
  String text;
  String content;
  String author;

  Post({
    required this.text,
    required this.content,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'text': text});
    result.addAll({'content': content});
    result.addAll({'author': author});

    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      text: map['text'] ?? '',
      content: map['content'] ?? '',
      author: map['author'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}

class PostsModel {
  List<Post> posts;

  PostsModel({
    required this.posts,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'posts': posts.map((x) => x.toMap()).toList()});

    return result;
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      posts: List<Post>.from(
          map['posts']?.map((x) => Post.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsModel.fromJson(String source) =>
      PostsModel.fromMap(json.decode(source));
}
