import '../models/intern.dart';
import '../models/announcement.dart';
import '../models/reward.dart';

class MockData {
  static final currentIntern = Intern(
    id: '1',
    name: 'Alex Johnson',
    email: 'alex@example.com',
    referralCode: 'ALEX2025',
    totalRaised: 15000,
    rank: 3,
  );

  static final List<Intern> leaderboard = [
    Intern(
      id: '2',
      name: 'Sarah Wilson',
      email: 'sarah@example.com',
      referralCode: 'SARAH2025',
      totalRaised: 25000,
      rank: 1,
    ),
    Intern(
      id: '3',
      name: 'Mike Chen',
      email: 'mike@example.com',
      referralCode: 'MIKE2025',
      totalRaised: 22000,
      rank: 2,
    ),
    currentIntern,
    Intern(
      id: '4',
      name: 'Emma Davis',
      email: 'emma@example.com',
      referralCode: 'EMMA2025',
      totalRaised: 12000,
      rank: 4,
    ),
    Intern(
      id: '5',
      name: 'David Brown',
      email: 'david@example.com',
      referralCode: 'DAVID2025',
      totalRaised: 8500,
      rank: 5,
    ),
  ];

  static final List<Announcement> announcements = [
    Announcement(
      id: '1',
      title: 'New Reward Tier Unlocked!',
      content:
          'Congratulations! A new reward tier is now available for interns who raise over ₹20,000.',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      isImportant: true,
    ),
    Announcement(
      id: '2',
      title: 'Monthly Leaderboard Update',
      content:
          'The monthly leaderboard has been updated. Check your ranking and keep up the great work!',
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Announcement(
      id: '3',
      title: 'Training Session Reminder',
      content:
          'Don\'t forget about the fundraising training session scheduled for this Friday at 3 PM.',
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Announcement(
      id: '4',
      title: 'Welcome New Interns!',
      content:
          'We\'re excited to welcome 5 new interns to our fundraising team. Let\'s help them get started!',
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  static final List<Reward> rewards = [
    Reward(
      id: '1',
      title: 'Bronze Badge',
      description: 'Raise ₹5,000',
      requiredAmount: 5000,
      isUnlocked: true,
      icon: '🥉',
    ),
    Reward(
      id: '2',
      title: 'Silver Badge',
      description: 'Raise ₹10,000',
      requiredAmount: 10000,
      isUnlocked: true,
      icon: '🥈',
    ),
    Reward(
      id: '3',
      title: 'Gold Badge',
      description: 'Raise ₹15,000',
      requiredAmount: 15000,
      isUnlocked: true,
      icon: '🥇',
    ),
    Reward(
      id: '4',
      title: 'Platinum Badge',
      description: 'Raise ₹25,000',
      requiredAmount: 25000,
      isUnlocked: false,
      icon: '💎',
    ),
    Reward(
      id: '5',
      title: 'Champion Badge',
      description: 'Raise ₹50,000',
      requiredAmount: 50000,
      isUnlocked: false,
      icon: '👑',
    ),
  ];
}
