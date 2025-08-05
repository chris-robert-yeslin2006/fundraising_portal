import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/mock_data.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboard = MockData.leaderboard;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildLeaderboardList(leaderboard),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.leaderboard,
              style: AppTextStyles.heading2,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'This Month',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardList(leaderboard) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: leaderboard.length,
      itemBuilder: (context, index) {
        final intern = leaderboard[index];
        final isCurrentUser = intern.id == MockData.currentIntern.id;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isCurrentUser 
                ? AppColors.primary.withOpacity(0.1)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: isCurrentUser 
                ? Border.all(color: AppColors.primary, width: 2)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              _buildRankBadge(intern.rank),
              const SizedBox(width: 12),
              Expanded(
                child: _buildProfileSection(intern, isCurrentUser),
              ),
              _buildAmountSection(intern),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRankBadge(int rank) {
    Color badgeColor;
    String emoji;
    
    switch (rank) {
      case 1:
        badgeColor = AppColors.warning;
        emoji = '🥇';
        break;
      case 2:
        badgeColor = AppColors.onSurfaceVariant;
        emoji = '🥈';
        break;
      case 3:
        badgeColor = const Color(0xFFCD7F32);
        emoji = '🥉';
        break;
      default:
        badgeColor = AppColors.onSurfaceVariant;
        emoji = '';
    }

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: rank <= 3
            ? Text(emoji, style: const TextStyle(fontSize: 18))
            : Text(
                '#$rank',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: badgeColor,
                ),
              ),
      ),
    );
  }

  Widget _buildProfileSection(intern, bool isCurrentUser) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                intern.name,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isCurrentUser ? AppColors.primary : AppColors.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isCurrentUser) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'You',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 4),
        Text(
          intern.referralCode,
          style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildAmountSection(intern) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '₹${(intern.totalRaised / 1000).toStringAsFixed(0)}K',
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.success,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Total Raised',
          style: AppTextStyles.caption.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}