class Reward {
  final String id;
  final String title;
  final String description;
  final double requiredAmount;
  final bool isUnlocked;
  final String icon;

  Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.requiredAmount,
    required this.isUnlocked,
    required this.icon,
  });
}
