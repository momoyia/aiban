import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../utils/app_colors.dart';
import '../services/follow_service.dart';
import '../models/story.dart';
import 'user_detail_screen.dart';
import 'likes_favorites_screen.dart';
import 'new_followers_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Map<int, bool> followStatus = {};

  @override
  void initState() {
    super.initState();
    _loadFollowStatus();
  }

  Future<void> _loadFollowStatus() async {
    final photographers = _getRecommendedPhotographers();
    for (var photographer in photographers) {
      final isFollowing = await FollowService.isFollowing(photographer['id']);
      setState(() {
        followStatus[photographer['id']] = isFollowing;
      });
    }
  }

  List<Map<String, dynamic>> _getRecommendedPhotographers() {
    return [
      {
        'id': 1,
        'name': '拾光者',
        'avatar': 'assets/images/avatar1.jpg',
        'title': '人像摄影师',
        'followers': '12.5k',
      },
      {
        'id': 2,
        'name': '云间漫步',
        'avatar': 'assets/images/avatar2.jpg',
        'title': '风光摄影师',
        'followers': '8.3k',
      },
      {
        'id': 3,
        'name': '街角诗人',
        'avatar': 'assets/images/avatar3.jpg',
        'title': '街拍摄影师',
        'followers': '15.2k',
      },
      {
        'id': 4,
        'name': '筑梦师',
        'avatar': 'assets/images/avatar4.jpg',
        'title': '建筑摄影师',
        'followers': '9.7k',
      },
      {
        'id': 5,
        'name': '晨曦微光',
        'avatar': 'assets/images/user1.jpg',
        'title': '自然摄影师',
        'followers': '11.4k',
      },
      {
        'id': 6,
        'name': '镜中世界',
        'avatar': 'assets/images/user2.jpg',
        'title': '商业摄影师',
        'followers': '18.9k',
      },
    ];
  }

  Future<void> _toggleFollow(int userId) async {
    final isFollowing = followStatus[userId] ?? false;
    if (isFollowing) {
      await FollowService.unfollowUser(userId);
    } else {
      await FollowService.followUser(userId);
    }
    setState(() {
      followStatus[userId] = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeader(),
            _buildNotificationCards(),
            _buildSectionTitle(),
            _buildPhotographersList(),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '消息',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCards() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LikesFavoritesScreen(),
                    ),
                  );
                },
                child: _buildNotificationCard(
                  icon: Icons.favorite_rounded,
                  label: '获赞和收藏',
                  color: AppColors.brandPrimary,
                  backgroundColor: AppColors.brandPrimary.withOpacity(0.1),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewFollowersScreen(),
                    ),
                  );
                },
                child: _buildNotificationCard(
                  icon: Icons.person_add_rounded,
                  label: '新增关注',
                  color: const Color(0xFFEC4899),
                  backgroundColor: const Color(0xFFEC4899).withOpacity(0.1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required String label,
    required Color color,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Text(
          '推荐关注',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildPhotographersList() {
    final photographers = _getRecommendedPhotographers();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return _buildPhotographerItem(photographers[index]);
          },
          childCount: photographers.length,
        ),
      ),
    );
  }

  Widget _buildPhotographerItem(Map<String, dynamic> photographer) {
    final isFollowing = followStatus[photographer['id']] ?? false;

    return GestureDetector(
      onTap: () {
        // 创建 Story 对象并导航到用户详情页
        final story = Story(
          id: photographer['id'],
          image: photographer['avatar'],
          name: photographer['name'],
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailScreen(user: story),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.brandSecondary.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  photographer['avatar'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.person_rounded, size: 28),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photographer['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    photographer['title'],
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.people_rounded,
                        size: 14,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${photographer['followers']} 关注者',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _toggleFollow(photographer['id']),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  gradient: isFollowing ? null : AppColors.brandGradient,
                  color: isFollowing ? Colors.grey.shade200 : null,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isFollowing ? '已关注' : '关注',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isFollowing ? AppColors.textSecondary : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
