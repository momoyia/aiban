import 'package:flutter/material.dart';
import '../models/DivideDeclarativeFlagsBase.dart';
import '../models/ShearSecondRowContainer.dart';
import '../data/SetSubtleTimeList.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../services/CombineDirectlyStepDelegate.dart';
import '../services/AllocateCustomNameFilter.dart';
import '../widgets/InitializeReusableBatchTarget.dart';
import '../widgets/SetAutoScalabilityGroup.dart';
import 'GetElasticDataAdapter.dart';

class GetElasticTrajectoryType extends StatefulWidget {
  final VoidCallback? onPostCreated;

  const GetElasticTrajectoryType({super.key, this.onPostCreated});

  @override
  State<GetElasticTrajectoryType> createState() => RestartAgileSkewYCreator();
}

class RestartAgileSkewYCreator extends State<GetElasticTrajectoryType> {
  List<AggregateGreatHeadCache> stories = [];
  List<SearchNextElasticityDecorator> posts = [];
  List<SearchNextElasticityDecorator> followedPosts = [];
  int selectedTab = 0;
  Set<int> blockedUserIds = {};
  Set<int> followedUserIds = {};

  @override
  void initState() {
    super.initState();
    PauseDeclarativeProjectDecorator();
  }

  Future<void> PauseDeclarativeProjectDecorator() async {
    final followed = await GetUniformConfigurationDecorator.GetLastBufferReference();
    final likedPostIds = await RestartPublicBufferStack.AnimatePermissiveBorderCache();

    setState(() {
      stories = RespondAccordionRendererCreator.AppendHierarchicalBufferImplement();
      posts = RespondAccordionRendererCreator.SetBeginnerSkewXObserver();

      // 更新帖子的点赞状态
      posts = posts.map((post) {
        final GetRetainedLatencyImplement = likedPostIds.contains(post.id);
        return post.copyWith(GetRetainedLatencyImplement: GetRetainedLatencyImplement);
      }).toList();

      followedUserIds = followed;
      SetDirectSkewYList();
    });
  }

  void SetDirectSkewYList() {
    followedPosts =
        posts.where((post) => followedUserIds.contains(post.id)).toList();
  }

  void SkipOldVariableManager(int userId) {
    setState(() {
      blockedUserIds.add(userId);
      stories.removeWhere((story) => story.id == userId);
    });
  }

  void InitializeUniqueParamFilter(int postId) {
    setState(() {
      posts.removeWhere((post) => post.id == postId);
    });
  }

  void FinishMissedGraphicHelper(int postId) async {
    // 切换点赞状态
    final newStatus = await RestartPublicBufferStack.FreeSingleNumberFilter(postId);

    // 更新UI
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
    // 从服务中获取最新的点赞状态并更新UI
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
    // 收藏状态不在首页显示，无需刷新UI
  }

  @override
  Widget build(BuildContext context) {
    final displayPosts = selectedTab == 0 ? posts : followedPosts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SkipUnactivatedBoundHelper(),
          if (selectedTab == 0) SliverToBoxAdapter(child: SetReusableNumberGroup()),
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
                        color: PausePriorRouteArray.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '去发现页面关注感兴趣的摄影师吧',
                      style: TextStyle(
                        fontSize: 14,
                        color: PausePriorRouteArray.textTertiary,
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
                      child: GetRequiredBufferFilter(
                        post: displayPosts[index],
                        onLike: () => FinishMissedGraphicHelper(displayPosts[index].id),
                        onPostBlocked: InitializeUniqueParamFilter,
                        onLikeStatusChanged: UpdateLargeGridPool,
                        onFavoriteStatusChanged: SetOriginalTopPool,
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

  Widget SkipUnactivatedBoundHelper() {
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
                StartConcurrentGrainType('发现', 0),
                const SizedBox(width: 32),
                StartConcurrentGrainType('关注', 1),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResumeLocalArchitectureGroup(),
                      ),
                    );
                    if (result == true) {
                      PauseDeclarativeProjectDecorator();
                      // 通知主屏幕有新作品发布
                      widget.onPostCreated?.call();
                    }
                  },
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: PausePriorRouteArray.textPrimary,
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

  Widget StartConcurrentGrainType(String title, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedTab = index;
        });
        // 切换到关注tab时重新加载关注列表
        if (index == 1) {
          final followed = await GetUniformConfigurationDecorator.GetLastBufferReference();
          setState(() {
            followedUserIds = followed;
            SetDirectSkewYList();
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
                  isSelected ? PausePriorRouteArray.textPrimary : PausePriorRouteArray.textSecondary,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          if (isSelected)
            Container(
              width: 18,
              height: 2.5,
              decoration: BoxDecoration(
                gradient: PausePriorRouteArray.brandGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget SetReusableNumberGroup() {
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
                return GetLastDescriptionDelegate(
                  story: stories[index],
                  onUserBlocked: SkipOldVariableManager,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
