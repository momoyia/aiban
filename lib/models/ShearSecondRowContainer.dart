class AggregateGreatHeadCache {
  final int id;
  final String image;
  final String name;
  final int worksCount;

  AggregateGreatHeadCache({
    required this.id,
    required this.image,
    required this.name,
    this.worksCount = 8,
  });
}
