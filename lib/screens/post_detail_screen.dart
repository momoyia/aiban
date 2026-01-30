import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/story.dart';
import '../utils/app_colors.dart';
import '../services/follow_service.dart';
import '../services/likes_favorites_service.dart';
import '../services/post_service.dart';
import '../services/block_mute_service.dart';
import 'report_screen.dart';
import 'user_detail_screen.dart';

class PostDetailScreen extends StatefulWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late bool isLiked;
  late bool isFavorited;
  late int likes;
  final TextEditingController _commentController = TextEditingController();
  late List<Comment> comments;
  bool isFollowing = false;
  bool isMyPost = false;
  bool likeChanged = false; // 跟踪点赞状态是否改变
  bool favoriteChanged = false; // 跟踪收藏状态是否改变

  @override
  void initState() {
    super.initState();
    isLiked = widget.post.isLiked;
    likes = widget.post.likes;
    comments = List.from(widget.post.comments);
    isFavorited = false;
    _loadFollowStatus();
    _loadLikeStatus();
    _loadFavoriteStatus();
    _checkIfMyPost();
  }

  Future<void> _checkIfMyPost() async {
    final myPosts = await PostService.getMyPosts();
    setState(() {
      isMyPost = myPosts.contains(widget.post.image);
    });
  }

  Future<void> _loadFollowStatus() async {
    final following = await FollowService.isFollowing(widget.post.id);
    setState(() {
      isFollowing = following;
    });
  }

  Future<void> _loadLikeStatus() async {
    final liked = await LikesFavoritesService.isLiked(widget.post.id);
    setState(() {
      isLiked = liked;
    });
  }

  Future<void> _loadFavoriteStatus() async {
    final favorited = await LikesFavoritesService.isFavorited(widget.post.id);
    setState(() {
      isFavorited = favorited;
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildAppBar(),
              _buildImage(),
              _buildContent(),
              _buildComments(),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary,
            size: 18,
          ),
        ),
        onPressed: () {
          if (likeChanged || favoriteChanged) {
            Navigator.pop(context, {
              'likeChanged': likeChanged,
              'favoriteChanged': favoriteChanged,
            });
          } else {
            Navigator.pop(context);
          }
        },
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.more_horiz_rounded,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
          onPressed: _showMoreOptions,
        ),
      ],
    );
  }

  Widget _buildImage() {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.post.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_rounded, size: 64),
                );
              },
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.post.location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息和关注按钮
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // 创建 Story 对象并导航到用户详情页
                    final story = Story(
                      id: widget.post.id,
                      image: widget.post.avatar,
                      name: widget.post.user,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(user: story),
                      ),
                    );
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Colors.grey.shade200, width: 1.5),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.post.avatar,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.person_rounded, size: 24),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // 创建 Story 对象并导航到用户详情页
                      final story = Story(
                        id: widget.post.id,
                        image: widget.post.avatar,
                        name: widget.post.user,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(user: story),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.user,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '2小时前',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 只有不是自己的帖子才显示关注按钮
                if (!isMyPost)
                  GestureDetector(
                    onTap: () async {
                      final newFollowStatus =
                          await FollowService.toggleFollow(widget.post.id);
                      setState(() {
                        isFollowing = newFollowStatus;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: isFollowing
                            ? Colors.grey.shade100
                            : AppColors.brandSecondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        isFollowing ? '已关注' : '关注',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isFollowing
                              ? AppColors.textSecondary
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            // 标题
            Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            // 描述
            Text(
              widget.post.description.isNotEmpty
                  ? widget.post.description
                  : '这是一张精心拍摄的作品，捕捉了最美的瞬间。',
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            // 点赞和评论统计
            Row(
              children: [
                GestureDetector(
                  onTap: _toggleLike,
                  child: Row(
                    children: [
                      Icon(
                        isLiked
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: isLiked ? Colors.red : AppColors.textSecondary,
                        size: 24,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatNumber(likes),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Row(
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: AppColors.textSecondary,
                      size: 24,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${comments.length}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: _toggleFavorite,
                  child: Icon(
                    isFavorited
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: isFavorited
                        ? AppColors.brandSecondary
                        : AppColors.textSecondary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComments() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '评论 ${comments.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            if (comments.isNotEmpty) ...[
              const SizedBox(height: 16),
              ...comments.map((comment) => _buildCommentItem(comment)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.brandSecondary.withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                comment.user[0],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brandSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.user,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: '说点什么...',
                      hintStyle: TextStyle(
                        color: AppColors.textTertiary,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: _addComment,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.brandSecondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleLike() async {
    final newLikeStatus =
        await LikesFavoritesService.toggleLike(widget.post.id);
    setState(() {
      isLiked = newLikeStatus;
      likes = isLiked ? likes + 1 : likes - 1;
      likeChanged = true; // 标记点赞状态已改变
    });
  }

  void _toggleFavorite() async {
    final newFavoriteStatus =
        await LikesFavoritesService.toggleFavorite(widget.post.id);
    setState(() {
      isFavorited = newFavoriteStatus;
      favoriteChanged = true; // 标记收藏状态已改变
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFavorited ? '已收藏' : '已取消收藏'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      comments.add(Comment(
        user: '我',
        content: _commentController.text.trim(),
      ));
      _commentController.clear();
    });

    // 隐藏键盘
    FocusScope.of(context).unfocus();
  }

  String _formatNumber(int number) {
    if (number >= 10000) {
      return '${(number / 10000).toStringAsFixed(1)}w';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
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
              // 如果是自己的帖子，显示删除选项
              if (isMyPost)
                _buildOptionItem(
                  icon: Icons.delete_rounded,
                  title: '删除',
                  subtitle: '删除这条动态',
                  onTap: () {
                    Navigator.pop(context);
                    _showDeleteConfirmation();
                  },
                  iconColor: Colors.red,
                  titleColor: Colors.red,
                )
              else ...[
                // 如果不是自己的帖子，显示拉黑、屏蔽、举报选项
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
                    _reportPost();
                  },
                  isLast: true,
                ),
              ],
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
    Color? iconColor,
    Color? titleColor,
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
                color: iconColor != null
                    ? iconColor.withOpacity(0.1)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor ?? AppColors.textPrimary,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: titleColor ?? AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
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

  void _blockUser() async {
    // 保存到拉黑列表
    await BlockMuteService.blockUser(
      widget.post.id.toString(),
      widget.post.user,
      widget.post.avatar,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已拉黑 ${widget.post.user}'),
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
        Navigator.pop(context, {'blocked': true, 'postId': widget.post.id});
      }
    });
  }

  void _muteUser() async {
    // 保存到屏蔽列表
    await BlockMuteService.muteUser(
      widget.post.id.toString(),
      widget.post.user,
      widget.post.avatar,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已屏蔽 ${widget.post.user}'),
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
        Navigator.pop(context, {'muted': true, 'postId': widget.post.id});
      }
    });
  }

  void _reportPost() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportScreen(userName: widget.post.user),
      ),
    );

    if (result == true && mounted) {
      Navigator.pop(context);
    }
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '删除动态',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: const Text(
          '确定要删除这条动态吗？删除后将无法恢复。',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              '取消',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 关闭对话框
              _deletePost();
            },
            child: const Text(
              '删除',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deletePost() async {
    // 删除帖子
    await PostService.deletePost(widget.post.image);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('动态已删除'),
        backgroundColor: AppColors.textPrimary,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );

    // 返回上一页并传递删除标记
    Navigator.pop(context, {'deleted': true, 'postImage': widget.post.image});
  }
}
