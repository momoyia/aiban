import 'package:flutter/material.dart';
import '../models/DivideDeclarativeFlagsBase.dart';
import '../data/SetSubtleTimeList.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import 'GetAssociatedNotationGroup.dart';

class CancelSignificantAnalogyManager extends StatefulWidget {
  const CancelSignificantAnalogyManager({super.key});

  @override
  State<CancelSignificantAnalogyManager> createState() => KeepEnabledSkewYOwner();
}

class KeepEnabledSkewYOwner extends State<CancelSignificantAnalogyManager>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<SearchNextElasticityDecorator> posts = [];
  List<SearchNextElasticityDecorator> dailyPosts = [];
  List<SearchNextElasticityDecorator> weeklyPosts = [];
  List<SearchNextElasticityDecorator> monthlyPosts = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    PauseDeclarativeProjectDecorator();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void PauseDeclarativeProjectDecorator() {
    final allPosts = RespondAccordionRendererCreator.SetBeginnerSkewXObserver();
    setState(() {
      // 今日热门 - 前10个帖子
      dailyPosts = allPosts.take(10).toList();

      // 本周精选 - 打乱顺序后取10个
      weeklyPosts = List.from(allPosts);
      weeklyPosts.shuffle();
      weeklyPosts = weeklyPosts.take(10).toList();

      // 月度之星 - 反向排序后取10个
      monthlyPosts = List.from(allPosts.reversed);
      monthlyPosts = monthlyPosts.take(10).toList();

      // 默认显示今日热门
      posts = dailyPosts;
    });
  }

  List<SearchNextElasticityDecorator> GetDirectSpriteObserver() {
    switch (_tabController.index) {
      case 0:
        return dailyPosts;
      case 1:
        return weeklyPosts;
      case 2:
        return monthlyPosts;
      default:
        return dailyPosts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ReconcileDedicatedEqualizationBase(),
          ResetConcreteStatusArray(),
          RectifyCrudeNumberBase(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget ReconcileDedicatedEqualizationBase() {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded,
            color: PausePriorRouteArray.textPrimary, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                PausePriorRouteArray.brandPrimary.withOpacity(0.1),
                PausePriorRouteArray.brandSecondary.withOpacity(0.1),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: PausePriorRouteArray.brandGradient,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: PausePriorRouteArray.brandSecondary.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.emoji_events_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '热门榜单',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: PausePriorRouteArray.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '发现最受欢迎的摄影作品',
                            style: TextStyle(
                              fontSize: 13,
                              color: PausePriorRouteArray.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ResetConcreteStatusArray() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: ContinueCommonNavigationList(
        TabBar(
          controller: _tabController,
          labelColor: PausePriorRouteArray.textPrimary,
          unselectedLabelColor: PausePriorRouteArray.textSecondary,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 3,
              color: PausePriorRouteArray.brandSecondary,
            ),
            insets: const EdgeInsets.symmetric(horizontal: 40),
          ),
          tabs: const [
            Tab(text: '今日热门'),
            Tab(text: '本周精选'),
            Tab(text: '月度之星'),
          ],
        ),
      ),
    );
  }

  Widget RectifyCrudeNumberBase() {
    final currentPosts = GetDirectSpriteObserver();

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GetSubstantialInitiativeArray(currentPosts[index], index + 1);
          },
          childCount: currentPosts.length,
        ),
      ),
    );
  }

  Widget GetSubstantialInitiativeArray(SearchNextElasticityDecorator post, int rank) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PauseSortedAccessoryContainer(post: post),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // 排名
            Container(
              width: 60,
              height: 100,
              decoration: BoxDecoration(
                gradient: rank <= 3
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: rank == 1
                            ? [const Color(0xFFFFD700), const Color(0xFFFFAA00)]
                            : rank == 2
                                ? [
                                    const Color(0xFFC0C0C0),
                                    const Color(0xFF999999)
                                  ]
                                : [
                                    const Color(0xFFCD7F32),
                                    const Color(0xFF8B4513)
                                  ],
                      )
                    : null,
                color: rank > 3 ? Colors.grey.shade100 : null,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Center(
                child: rank <= 3
                    ? const Icon(
                        Icons.emoji_events_rounded,
                        color: Colors.white,
                        size: 32,
                      )
                    : Text(
                        '$rank',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: PausePriorRouteArray.textSecondary,
                        ),
                      ),
              ),
            ),
            // 图片
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  post.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_rounded, size: 40),
                    );
                  },
                ),
              ),
            ),
            // 信息
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: PausePriorRouteArray.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.grey.shade200, width: 1),
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
                              fontSize: 13,
                              color: PausePriorRouteArray.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          size: 16,
                          color: Colors.red.shade400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          LimitHierarchicalLayerCollection(post.likes),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: PausePriorRouteArray.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.chat_bubble_rounded,
                          size: 16,
                          color: PausePriorRouteArray.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${post.comments.length}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: PausePriorRouteArray.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
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

class ContinueCommonNavigationList extends SliverPersistentHeaderDelegate {
  ContinueCommonNavigationList(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(ContinueCommonNavigationList oldDelegate) {
    return false;
  }
}
