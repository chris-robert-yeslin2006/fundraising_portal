import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/mock_data.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/stats_card.dart';
import '../../features/leaderboard/pages/leaderboard_page.dart';
import '../../features/announcements/pages/announcements_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          _DashboardContent(),
          LeaderboardPage(),
          AnnouncementsPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTapped,
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    final intern = MockData.currentIntern;
    final rewards = MockData.rewards;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(intern),
            const SizedBox(height: 24),
            _buildStatsGrid(intern),
            const SizedBox(height: 24),
            _buildRewardsSection(rewards),
            const SizedBox(height: 20), // Extra padding at bottom
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(intern) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, ${intern.name.split(' ')[0]}! 👋',
          style: AppTextStyles.heading2,
        ),
        const SizedBox(height: 8),
        Text(
          'Keep up the amazing work!',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(intern) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate card width based on available space
        final cardWidth = (constraints.maxWidth - 16) / 2; // 16 for gap
        final cardHeight = cardWidth * 0.85; // Adjusted aspect ratio
        
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: _buildStatCard(
                title: AppStrings.totalRaised,
                value: '₹${(intern.totalRaised / 1000).toStringAsFixed(0)}K',
                icon: Icons.trending_up,
                color: AppColors.success,
              ),
            ),
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: _buildStatCard(
                title: 'Rank',
                value: '#${intern.rank}',
                icon: Icons.emoji_events,
                color: AppColors.warning,
              ),
            ),
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: _buildStatCard(
                title: 'Referral',
                value: intern.referralCode,
                icon: Icons.share,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: _buildStatCard(
                title: 'Rewards',
                value: '${MockData.rewards.where((r) => r.isUnlocked).length}',
                icon: Icons.card_giftcard,
                color: AppColors.secondary,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: AppTextStyles.heading3.copyWith(fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardsSection(rewards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.rewards,
          style: AppTextStyles.heading3,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rewards.length,
            padding: const EdgeInsets.only(right: 16),
            itemBuilder: (context, index) {
              final reward = rewards[index];
              return Container(
                width: 90,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: reward.isUnlocked
                      ? AppColors.success.withOpacity(0.1)
                      : AppColors.onSurfaceVariant.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: reward.isUnlocked
                      ? Border.all(color: AppColors.success, width: 2)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      reward.icon,
                      style: const TextStyle(fontSize: 28),
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        reward.title,
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: reward.isUnlocked
                              ? AppColors.success
                              : AppColors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}