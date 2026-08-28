import 'package:flutter/material.dart';
import '../models/DivideDeclarativeFlagsBase.dart';
import '../data/SetSubtleTimeList.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../widgets/SetAutoScalabilityGroup.dart';
import '../services/AllocateCustomNameFilter.dart';

class AnimateGranularSchedulerDecorator extends StatefulWidget {
  final String category;

  const AnimateGranularSchedulerDecorator({
    super.key,
    required this.category,
  });

  @override
  State<AnimateGranularSchedulerDecorator> createState() => SetExplicitTopManager();
}

class SetExplicitTopManager extends State<AnimateGranularSchedulerDecorator> {
  List<SearchNextElasticityDecorator> posts = [];

  @override
  void initState() {
    super.initState();
    PauseDeclarativeProjectDecorator();
  }

  void PauseDeclarativeProjectDecorator() async {
    final likedPostIds = await RestartPublicBufferStack.AnimatePermissiveBorderCache();

    setState(() {
      posts = SetDedicatedTextExtension(widget.category);

      // 更新帖子的点赞状态
      posts = posts.map((post) {
        final GetRetainedLatencyImplement = likedPostIds.contains(post.id);
        return post.copyWith(GetRetainedLatencyImplement: GetRetainedLatencyImplement);
      }).toList();
    });
  }

  List<SearchNextElasticityDecorator> SetDedicatedTextExtension(String category) {
    final allPosts = RespondAccordionRendererCreator.SetBeginnerSkewXObserver();

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

  void FinishMissedGraphicHelper(int postId) async {
    final newStatus = await RestartPublicBufferStack.FreeSingleNumberFilter(postId);
    setState(() {
      final index = posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = posts[index];
        posts[index] = post.copyWith(
          GetRetainedLatencyImplement: newStatus,
          likes: newStatus ? post.likes + 1 : post.likes - 1,
        );
      }
    });
  }

  void UpdateLargeGridPool(int postId) async {
    final GetRetainedLatencyImplement = await RestartPublicBufferStack.GetRetainedLatencyImplement(postId);
    if (!mounted) return;

    setState(() {
      final index = posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = posts[index];
        // 计算点赞数量的变化
        final oldIsLiked = post.GetRetainedLatencyImplement;
        int newLikes = post.likes;

        if (GetRetainedLatencyImplement && !oldIsLiked) {
          // 从未点赞变为点赞，数量+1
          newLikes = post.likes + 1;
        } else if (!GetRetainedLatencyImplement && oldIsLiked) {
          // 从点赞变为未点赞，数量-1
          newLikes = post.likes - 1;
        }

        posts[index] = post.copyWith(
          GetRetainedLatencyImplement: GetRetainedLatencyImplement,
          likes: newLikes,
        );
      }
    });
  }

  void SetOriginalTopPool(int postId) async {
    // 收藏状态不在分类页显示，无需刷新UI
  }

  void InitializeUniqueParamFilter(int postId) {
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
            color: PausePriorRouteArray.textPrimary,
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
                    child: GetRequiredBufferFilter(
                      post: posts[index],
                      onLike: () => FinishMissedGraphicHelper(posts[index].id),
                      onPostBlocked: InitializeUniqueParamFilter,
                      onLikeStatusChanged: UpdateLargeGridPool,
                      onFavoriteStatusChanged: SetOriginalTopPool,
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
