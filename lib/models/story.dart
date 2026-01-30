class Story {
  final int id;
  final String image;
  final String name;
  final int worksCount;

  Story({
    required this.id,
    required this.image,
    required this.name,
    this.worksCount = 8,
  });
}
