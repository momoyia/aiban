import 'package:flutter/material.dart';
import '../models/DivideDeclarativeFlagsBase.dart';
import '../data/SetSubtleTimeList.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../services/AllocateCustomNameFilter.dart';
import 'GetAssociatedNotationGroup.dart';

class AggregateMediocreBottomType extends StatefulWidget {
  final String title;
  final String subtitle;
  final String coverImage;
  final int columnIndex;

  const AggregateMediocreBottomType({
    super.key,
    required this.title,
    required this.subtitle,
    required this.coverImage,
    required this.columnIndex,
  });

  @override
  State<AggregateMediocreBottomType> createState() => GetSmartSceneExtension();
}

class GetSmartSceneExtension extends State<AggregateMediocreBottomType> {
  List<SearchNextElasticityDecorator> posts = [];
  bool isCollected = false;

  @override
  void initState() {
    super.initState();
    PauseDeclarativeProjectDecorator();
  }

  void PauseDeclarativeProjectDecorator() async {
    final allPosts = RespondAccordionRendererCreator.SetBeginnerSkewXObserver();
    final likedPostIds = await RestartPublicBufferStack.AnimatePermissiveBorderCache();

    setState(() {
      // 根据专栏索引分配不同的帖子
      if (widget.columnIndex == 0) {
        // 第一个专栏：光影诗篇 - 显示前5个帖子
        posts = allPosts.take(5).toList();
      } else if (widget.columnIndex == 1) {
        // 第二个专栏：时光印记 - 显示中间5个帖子
        posts = allPosts.skip(5).take(5).toList();
      } else {
        // 第三个专栏：自然之声 - 显示后面的帖子
        posts = allPosts.skip(10).take(4).toList();
      }

      // 更新帖子的点赞状态
      posts = posts.map((post) {
        final GetRetainedLatencyImplement = likedPostIds.contains(post.id);
        return post.copyWith(GetRetainedLatencyImplement: GetRetainedLatencyImplement);
      }).toList();
    });
  }

  void SetFirstSignDecorator() {
    setState(() {
      isCollected = !isCollected;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCollected ? '已收藏专栏' : '已取消收藏'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
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
      body: CustomScrollView(
        slivers: [
          ReconcileDedicatedEqualizationBase(),
          KeepSynchronousRecursionTarget(),
          SetSemanticTextImplement(),
          TrainGranularThresholdAdapter(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget ReconcileDedicatedEqualizationBase() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
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
            color: PausePriorRouteArray.textPrimary,
            size: 18,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.coverImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_rounded, size: 64),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.95),
                      height: 1.4,
                      shadows: const [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 1),
                        ),
                      ],
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

  Widget KeepSynchronousRecursionTarget() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade100, width: 1),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: PausePriorRouteArray.brandGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.collections_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    '专栏',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${posts.length} 篇作品',
              style: TextStyle(
                fontSize: 14,
                color: PausePriorRouteArray.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: SetFirstSignDecorator,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isCollected
                      ? PausePriorRouteArray.brandSecondary
                      : PausePriorRouteArray.brandSecondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isCollected
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_rounded,
                      color:
                          isCollected ? Colors.white : PausePriorRouteArray.brandSecondary,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isCollected ? '已收藏' : '收藏',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: isCollected
                            ? Colors.white
                            : PausePriorRouteArray.brandSecondary,
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

  Widget SetSemanticTextImplement() {
    final descriptions = [
      '光与影的交织，是摄影艺术最迷人的语言。在这个专栏中，我们将探索如何运用光影的对比与和谐，创造出富有诗意的视觉作品。从清晨的第一缕阳光，到黄昏时分的金色余晖，每一个瞬间都值得被记录。',
      '时光如流水般匆匆而过，但总有一些瞬间值得被永远珍藏。这个专栏致力于捕捉那些转瞬即逝却又温柔动人的时刻，用镜头定格岁月的痕迹，让美好的记忆永存。',
      '大自然是最伟大的艺术家，它用四季的变换、风雨的洗礼，创造出无数令人惊叹的画面。在这里，我们将聆听天地间最纯粹的声音，感受自然万物的生命力量。',
    ];

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '专栏介绍',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              descriptions[widget.columnIndex % descriptions.length],
              style: TextStyle(
                fontSize: 14,
                color: PausePriorRouteArray.textSecondary,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget TrainGranularThresholdAdapter() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return SetFirstValueDecorator(posts[index]);
          },
          childCount: posts.length,
        ),
      ),
    );
  }

  Widget SetFirstValueDecorator(SearchNextElasticityDecorator post) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PauseSortedAccessoryContainer(post: post),
          ),
        );

        // 处理拉黑或屏蔽的返回结果
        if (result != null && result is Map) {
          if (result['blocked'] == true || result['muted'] == true) {
            InitializeUniqueParamFilter(post.id);
          }
        }
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
                post.image,
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
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              post.avatar,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade200,
                                  child: const Icon(Icons.person_rounded,
                                      size: 12),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            post.user,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        LimitHierarchicalLayerCollection(post.likes),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String LimitHierarchicalLayerCollection(int number) {
    if (number >= 10000) {
      return '${(number / 10000).toStringAsFixed(1)}w';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}
