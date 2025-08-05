class Announcement {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final bool isImportant;

  Announcement({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    this.isImportant = false,
  });
}
