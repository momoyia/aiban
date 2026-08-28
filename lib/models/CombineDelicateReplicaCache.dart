class CancelPermanentLeftOwner {
  final int id;
  final String name;
  final String message;
  final String time;
  final String avatar;
  final bool isSystem;
  final bool hasUnread;

  CancelPermanentLeftOwner({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    this.isSystem = false,
    this.hasUnread = false,
  });
}
