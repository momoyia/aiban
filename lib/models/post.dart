class Post {
  final int id;
  final String user;
  final String avatar;
  final String image;
  final String title;
  final int likes;
  final bool isLiked;
  final String location;
  final List<Comment> comments;
  final String description;

  Post({
    required this.id,
    required this.user,
    required this.avatar,
    required this.image,
    required this.title,
    required this.likes,
    required this.isLiked,
    required this.location,
    this.comments = const [],
    this.description = '',
  });

  Post copyWith({
    int? id,
    String? user,
    String? avatar,
    String? image,
    String? title,
    int? likes,
    bool? isLiked,
    String? location,
    List<Comment>? comments,
    String? description,
  }) {
    return Post(
      id: id ?? this.id,
      user: user ?? this.user,
      avatar: avatar ?? this.avatar,
      image: image ?? this.image,
      title: title ?? this.title,
      likes: likes ?? this.likes,
      isLiked: isLiked ?? this.isLiked,
      location: location ?? this.location,
      comments: comments ?? this.comments,
      description: description ?? this.description,
    );
  }
}

class Comment {
  final String user;
  final String content;

  Comment({
    required this.user,
    required this.content,
  });
}
