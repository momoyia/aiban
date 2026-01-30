import 'package:flutter/material.dart';
import '../models/post.dart';
import '../data/mock_data.dart';
import '../utils/app_colors.dart';
import '../widgets/post_card.dart';
import '../services/likes_favorites_service.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String category;

  const CategoryDetailScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final likedPostIds = await LikesFavoritesService.getLikedPostIds();

    setState(() {
      posts = _getPostsByCategory(widget.category);

      // 更新帖子的点赞状态
      posts = posts.map((post) {
        final isLiked = likedPostIds.contains(post.id);
        return post.copyWith(isLiked: isLiked);
      }).toList();
    });
  }

  List<Post> _getPostsByCategory(String category) {
    final allPosts = MockData.getFeedPosts();

    // 根据分类返回不同的帖子，每个分类6条数据
    switch (category) {
      case '人像':
        return allPosts
            .where((p) => [105, 115, 117, 103, 107, 108].contains(p.id))
            .toList();
      case '极简':
        return allPosts
            .where((p) => [106, 102, 114, 110, 113, 120].contains(p.id))
            .toList();
      case '街拍':
        return allPosts
            .where((p) => [107, 103, 108, 105, 115, 117].contains(p.id))
            .toList();
      case '旅行':
        return allPosts
            .where((p) => [101, 111, 116, 118, 114, 119].contains(p.id))
            .toList();
      case '静物':
        return allPosts
            .where((p) => [109, 104, 119, 102, 112, 106].contains(p.id))
            .toList();
      case '建筑':
        return allPosts
            .where((p) => [110, 113, 117, 114, 103, 108].contains(p.id))
            .toList();
      case '风光':
        return allPosts
            .where((p) => [120, 101, 111, 116, 118, 119].contains(p.id))
            .toList();
      case '美食':
        return allPosts
            .where((p) => [112, 102, 109, 106, 113, 120].contains(p.id))
            .toList();
      default:
        return allPosts.take(6).toList();
    }
  }

  void _toggleLike(int postId) async {
    final newStatus = await LikesFavoritesService.toggleLike(postId);
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
    // 收藏状态不在分类页显示，无需刷新UI
  }

  void _handlePostBlocked(int postId) {
    setState(() {
      posts.removeWhere((post) => post.id == postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          widget.category,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: PostCard(
                      post: posts[index],
                      onLike: () => _toggleLike(posts[index].id),
                      onPostBlocked: _handlePostBlocked,
                      onLikeStatusChanged: _refreshPostLikeStatus,
                      onFavoriteStatusChanged: _refreshPostFavoriteStatus,
                    ),
                  );
                },
                childCount: posts.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
