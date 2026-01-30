import 'package:flutter/material.dart';
import '../models/story.dart';
import '../data/mock_data.dart';
import '../utils/app_colors.dart';
import '../services/follow_service.dart';
import 'report_screen.dart';
import 'post_detail_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final Story user;

  const UserDetailScreen({super.key, required this.user});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  bool isFollowing = false;
  bool isBlocked = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    _loadFollowStatus();
  }

  Future<void> _loadFollowStatus() async {
    final following = await FollowService.isFollowing(widget.user.id);
    setState(() {
      isFollowing = following;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildUserProfile(),
          _buildTags(),
          _buildWorksHeader(),
          _buildWorksGrid(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 80,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz_rounded,
              color: AppColors.textPrimary),
          onPressed: _showMoreOptions,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.brandPrimary.withOpacity(0.05),
                AppColors.brandSecondary.withOpacity(0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    final userInfo = _getUserInfo();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.brandSecondary,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.brandSecondary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(3),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(3),
                child: ClipOval(
                  child: Image.asset(
                    widget.user.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.person_rounded, size: 40),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.user.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.brandSecondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'PRO',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userInfo['title']!,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMiniStat('${_getWorksCount()}', '作品'),
                      const SizedBox(width: 20),
                      _buildMiniStat(userInfo['followers']!, '粉丝'),
                      const SizedBox(width: 20),
                      _buildMiniStat(userInfo['likes']!, '获赞'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTags() {
    final userInfo = _getUserInfo();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userInfo['bio']!,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: userInfo['tags']!.split(',').map((tag) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.brandSecondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.brandSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            _buildFollowButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowButton() {
    return GestureDetector(
      onTap: () async {
        final newFollowStatus =
            await FollowService.toggleFollow(widget.user.id);
        setState(() {
          isFollowing = newFollowStatus;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isFollowing ? Colors.grey.shade100 : AppColors.brandSecondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          isFollowing ? '已关注' : '关注',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isFollowing ? AppColors.textSecondary : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildWorksHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '作品集',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.grid_view_rounded,
                      size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    '${_getWorksCount()}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorksGrid() {
    final works = _getUserWorks();
    final allPosts = MockData.getFeedPosts();

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            // 根据图片路径找到对应的帖子
            final workImage = works[index];
            final post = allPosts.firstWhere(
              (p) => p.image == workImage,
              orElse: () => allPosts[index % allPosts.length],
            );

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailScreen(post: post),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        works[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.image_rounded, size: 40),
                          );
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: works.length,
        ),
      ),
    );
  }

  Map<String, String> _getUserInfo() {
    final userId = widget.user.id;

    switch (userId) {
      case 1:
        return {
          'title': '人像摄影师 · 光影艺术家',
          'bio': '专注人像与情绪表达，用光影讲述每个人的故事',
          'tags': '人像,情绪,光影,艺术',
          'followers': '2.3k',
          'likes': '12.5k',
        };
      case 2:
        return {
          'title': '风光摄影师 · 旅行达人',
          'bio': '行走在山川湖海之间，记录大自然的壮美瞬间',
          'tags': '风光,旅行,自然,山川',
          'followers': '3.1k',
          'likes': '18.2k',
        };
      case 3:
        return {
          'title': '街拍摄影师 · 城市观察者',
          'bio': '在城市的街头巷尾，捕捉生活的真实与温度',
          'tags': '街拍,城市,纪实,生活',
          'followers': '1.8k',
          'likes': '9.6k',
        };
      case 4:
        return {
          'title': '建筑摄影师 · 几何美学',
          'bio': '探索建筑的线条与空间，发现几何之美',
          'tags': '建筑,几何,极简,空间',
          'followers': '2.7k',
          'likes': '15.3k',
        };
      case 5:
        return {
          'title': '美食摄影师 · 生活美学家',
          'bio': '用镜头记录美食的色香味，分享生活的小确幸',
          'tags': '美食,静物,生活,美学',
          'followers': '4.2k',
          'likes': '22.8k',
        };
      case 6:
        return {
          'title': '野生动物摄影师',
          'bio': '深入自然，记录野生动物的生存与美丽',
          'tags': '动物,自然,生态,野外',
          'followers': '5.6k',
          'likes': '31.4k',
        };
      case 7:
        return {
          'title': '黑白摄影师 · 极简主义',
          'bio': '在黑白世界中寻找纯粹的美与力量',
          'tags': '黑白,极简,艺术,纯粹',
          'followers': '3.9k',
          'likes': '19.7k',
        };
      case 8:
        return {
          'title': '微距摄影师 · 细节控',
          'bio': '放大微观世界，发现肉眼看不见的奇妙',
          'tags': '微距,细节,昆虫,植物',
          'followers': '2.1k',
          'likes': '11.3k',
        };
      case 9:
        return {
          'title': '婚礼摄影师 · 情感记录者',
          'bio': '记录爱情最美的时刻，定格幸福的瞬间',
          'tags': '婚礼,情感,爱情,幸福',
          'followers': '6.8k',
          'likes': '38.5k',
        };
      case 10:
        return {
          'title': '运动摄影师 · 瞬间捕手',
          'bio': '捕捉运动中的力量与激情，定格精彩瞬间',
          'tags': '运动,动态,激情,瞬间',
          'followers': '4.5k',
          'likes': '25.9k',
        };
      default:
        return {
          'title': '摄影师 · 创作者',
          'bio': '用镜头记录生活的美好瞬间',
          'tags': '摄影,创作,生活',
          'followers': '1.2k',
          'likes': '8.5k',
        };
    }
  }

  List<String> _getUserWorks() {
    final userId = widget.user.id;
    final worksCount = widget.user.worksCount;

    // 所有可用的图片
    final allImages = [
      'assets/images/explore1.jpg',
      'assets/images/explore2.jpg',
      'assets/images/explore3.jpg',
      'assets/images/explore4.jpg',
      'assets/images/explore5.jpg',
      'assets/images/explore6.jpg',
      'assets/images/explore7.jpg',
      'assets/images/explore8.jpg',
      'assets/images/post1.jpg',
      'assets/images/post2.jpg',
      'assets/images/post3.jpg',
      'assets/images/post4.jpg',
      'assets/images/work1.jpg',
      'assets/images/work2.jpg',
      'assets/images/work3.jpg',
      'assets/images/work4.jpg',
      'assets/images/work5.jpg',
      'assets/images/work6.jpg',
      'assets/images/work7.jpg',
      'assets/images/work8.jpg',
      'assets/images/work9.jpg',
    ];

    // 根据用户ID生成不同的起始索引，确保每个用户的作品不同且不重复
    final startIndex = (userId - 1) * 2;

    // 从不同位置开始选择图片，确保同一用户的作品不重复
    final userWorks = <String>[];
    for (int i = 0; i < worksCount && i < allImages.length; i++) {
      final imageIndex = (startIndex + i) % allImages.length;
      userWorks.add(allImages[imageIndex]);
    }

    return userWorks;
  }

  int _getWorksCount() {
    return widget.user.worksCount;
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              _buildOptionItem(
                icon: Icons.block_rounded,
                title: '拉黑',
                subtitle: '不再看到此用户的内容',
                onTap: () {
                  Navigator.pop(context);
                  _blockUser();
                },
              ),
              _buildOptionItem(
                icon: Icons.visibility_off_rounded,
                title: '屏蔽',
                subtitle: '暂时隐藏此用户的内容',
                onTap: () {
                  Navigator.pop(context);
                  _muteUser();
                },
              ),
              _buildOptionItem(
                icon: Icons.flag_rounded,
                title: '举报',
                subtitle: '举报不当内容或行为',
                onTap: () {
                  Navigator.pop(context);
                  _reportUser();
                },
                isLast: true,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(
                  bottom: BorderSide(color: Colors.grey.shade100, width: 1),
                ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.textPrimary, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  void _blockUser() {
    setState(() {
      isBlocked = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已拉黑 ${widget.user.name}'),
        backgroundColor: AppColors.textPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context, {'blocked': true});
      }
    });
  }

  void _muteUser() {
    setState(() {
      isMuted = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已屏蔽 ${widget.user.name}'),
        backgroundColor: AppColors.textPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context, {'muted': true});
      }
    });
  }

  void _reportUser() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportScreen(userName: widget.user.name),
      ),
    );

    if (result == true && mounted) {
      Navigator.pop(context);
    }
  }
}
