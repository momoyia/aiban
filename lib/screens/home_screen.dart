import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/story.dart';
import '../data/mock_data.dart';
import '../utils/app_colors.dart';
import '../services/follow_service.dart';
import '../services/likes_favorites_service.dart';
import '../widgets/story_item.dart';
import '../widgets/post_card.dart';
import 'create_post_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onPostCreated;

  const HomeScreen({super.key, this.onPostCreated});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Story> stories = [];
  List<Post> posts = [];
  List<Post> followedPosts = [];
  int selectedTab = 0;
  Set<int> blockedUserIds = {};
  Set<int> followedUserIds = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final followed = await FollowService.getFollowedUsers();
    final likedPostIds = await LikesFavoritesService.getLikedPostIds();

    setState(() {
      stories = MockData.getStories();
      posts = MockData.getFeedPosts();

      // 更新帖子的点赞状态
      posts = posts.map((post) {
        final isLiked = likedPostIds.contains(post.id);
        return post.copyWith(isLiked: isLiked);
      }).toList();

      followedUserIds = followed;
      _updateFollowedPosts();
    });
  }

  void _updateFollowedPosts() {
    followedPosts =
        posts.where((post) => followedUserIds.contains(post.id)).toList();
  }

  void _handleUserBlocked(int userId) {
    setState(() {
      blockedUserIds.add(userId);
      stories.removeWhere((story) => story.id == userId);
    });
  }

  void _handlePostBlocked(int postId) {
    setState(() {
      posts.removeWhere((post) => post.id == postId);
    });
  }

  void _toggleLike(int postId) async {
    // 切换点赞状态
    final newStatus = await LikesFavoritesService.toggleLike(postId);

    // 更新UI
    setState(() {
      final index = posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = posts[index];
        posts[index] = post.copyWith(
          isLiked: newStatus,
          likes: newStatus ? post.likes + 1 : post.likes - 1,
        );
      }
    });
  }

  void _refreshPostLikeStatus(int postId) async {
    // 从服务中获取最新的点赞状态并更新UI
    final isLiked = await LikesFavoritesService.isLiked(postId);
    if (!mounted) return;

    setState(() {
      final index = posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = posts[index];
        // 计算点赞数量的变化
        final oldIsLiked = post.isLiked;
        int newLikes = post.likes;

        if (isLiked && !oldIsLiked) {
          // 从未点赞变为点赞，数量+1
          newLikes = post.likes + 1;
        } else if (!isLiked && oldIsLiked) {
          // 从点赞变为未点赞，数量-1
          newLikes = post.likes - 1;
        }

        posts[index] = post.copyWith(
          isLiked: isLiked,
          likes: newLikes,
        );
      }
    });
  }

  void _refreshPostFavoriteStatus(int postId) async {
    // 收藏状态不在首页显示，无需刷新UI
  }

  @override
  Widget build(BuildContext context) {
    final displayPosts = selectedTab == 0 ? posts : followedPosts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildTopNavigation(),
          if (selectedTab == 0) SliverToBoxAdapter(child: _buildStorySection()),
          if (displayPosts.isEmpty && selectedTab == 1)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline_rounded,
                      size: 64,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '还没有关注任何人',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '去发现页面关注感兴趣的摄影师吧',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: PostCard(
                        post: displayPosts[index],
                        onLike: () => _toggleLike(displayPosts[index].id),
                        onPostBlocked: _handlePostBlocked,
                        onLikeStatusChanged: _refreshPostLikeStatus,
                        onFavoriteStatusChanged: _refreshPostFavoriteStatus,
                      ),
                    );
                  },
                  childCount: displayPosts.length,
                ),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildTopNavigation() {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 60,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade100,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                _buildTabItem('发现', 0),
                const SizedBox(width: 32),
                _buildTabItem('关注', 1),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreatePostScreen(),
                      ),
                    );
                    if (result == true) {
                      _loadData();
                      // 通知主屏幕有新作品发布
                      widget.onPostCreated?.call();
                    }
                  },
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.textPrimary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedTab = index;
        });
        // 切换到关注tab时重新加载关注列表
        if (index == 1) {
          final followed = await FollowService.getFollowedUsers();
          setState(() {
            followedUserIds = followed;
            _updateFollowedPosts();
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color:
                  isSelected ? AppColors.textPrimary : AppColors.textSecondary,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          if (isSelected)
            Container(
              width: 18,
              height: 2.5,
              decoration: BoxDecoration(
                gradient: AppColors.brandGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStorySection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return StoryItem(
                  story: stories[index],
                  onUserBlocked: _handleUserBlocked,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
