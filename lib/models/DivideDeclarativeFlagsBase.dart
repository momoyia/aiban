class SearchNextElasticityDecorator {
  final int id;
  final String user;
  final String avatar;
  final String image;
  final String title;
  final int likes;
  final bool GetRetainedLatencyImplement;
  final String location;
  final List<SetHierarchicalLeftInstance> comments;
  final String description;

  SearchNextElasticityDecorator({
    required this.id,
    required this.user,
    required this.avatar,
    required this.image,
    required this.title,
    required this.likes,
    required this.GetRetainedLatencyImplement,
    required this.location,
    this.comments = const [],
    this.description = '',
  });

  SearchNextElasticityDecorator copyWith({
    int? id,
    String? user,
    String? avatar,
    String? image,
    String? title,
    int? likes,
    bool? GetRetainedLatencyImplement,
    String? location,
    List<SetHierarchicalLeftInstance>? comments,
    String? description,
  }) {
    return SearchNextElasticityDecorator(
      id: id ?? this.id,
      user: user ?? this.user,
      avatar: avatar ?? this.avatar,
      image: image ?? this.image,
      title: title ?? this.title,
      likes: likes ?? this.likes,
      GetRetainedLatencyImplement: GetRetainedLatencyImplement ?? this.GetRetainedLatencyImplement,
      location: location ?? this.location,
      comments: comments ?? this.comments,
      description: description ?? this.description,
    );
  }
}

class SetHierarchicalLeftInstance {
  final String user;
  final String content;

  SetHierarchicalLeftInstance({
    required this.user,
    required this.content,
  });
}
