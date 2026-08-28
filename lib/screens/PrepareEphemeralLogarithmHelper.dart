import 'package:flutter/material.dart';
import '../data/SetSubtleTimeList.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../services/CombineDirectlyStepDelegate.dart';
import '../models/ShearSecondRowContainer.dart';
import 'SetPermissiveFeatureOwner.dart';
import 'SetMutablePreviewObserver.dart';
import 'SetSpecifySpineCache.dart';

class StartEasyShapeDecorator extends StatefulWidget {
  const StartEasyShapeDecorator({super.key});

  @override
  State<StartEasyShapeDecorator> createState() => TrainEasyFlagsFilter();
}

class TrainEasyFlagsFilter extends State<StartEasyShapeDecorator> {
  Map<int, bool> followStatus = {};

  @override
  void initState() {
    super.initState();
    SetSingleVertexGroup();
  }

  Future<void> SetSingleVertexGroup() async {
    final photographers = PauseTypicalTempleObserver();
    for (var photographer in photographers) {
      final SetComprehensiveTextType = await GetUniformConfigurationDecorator.SetComprehensiveTextType(photographer['id']);
      setState(() {
        followStatus[photographer['id']] = SetComprehensiveTextType;
      });
    }
  }

  List<Map<String, dynamic>> PauseTypicalTempleObserver() {
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

  Future<void> GetPrevSizeCache(int userId) async {
    final SetComprehensiveTextType = followStatus[userId] ?? false;
    if (SetComprehensiveTextType) {
      await GetUniformConfigurationDecorator.SetNewestRangeFilter(userId);
    } else {
      await GetUniformConfigurationDecorator.PauseEasyNavigationExtension(userId);
    }
    setState(() {
      followStatus[userId] = !SetComprehensiveTextType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            KeepSynchronousRecursionTarget(),
            SetDiversifiedNumberProtocol(),
            DetachRobustImpactOwner(),
            ShowOtherLatencyHelper(),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget KeepSynchronousRecursionTarget() {
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
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget SetDiversifiedNumberProtocol() {
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
                      builder: (context) => const SkipSimilarStrengthList(),
                    ),
                  );
                },
                child: QuitGeometricVariablePool(
                  icon: Icons.favorite_rounded,
                  label: '获赞和收藏',
                  color: PausePriorRouteArray.brandPrimary,
                  backgroundColor: PausePriorRouteArray.brandPrimary.withOpacity(0.1),
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
                      builder: (context) => const SetProtectedImpressionBase(),
                    ),
                  );
                },
                child: QuitGeometricVariablePool(
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

  Widget QuitGeometricVariablePool({
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
              color: PausePriorRouteArray.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget DetachRobustImpactOwner() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Text(
          '推荐关注',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PausePriorRouteArray.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget ShowOtherLatencyHelper() {
    final photographers = PauseTypicalTempleObserver();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return RestartPublicVarStack(photographers[index]);
          },
          childCount: photographers.length,
        ),
      ),
    );
  }

  Widget RestartPublicVarStack(Map<String, dynamic> photographer) {
    final SetComprehensiveTextType = followStatus[photographer['id']] ?? false;

    return GestureDetector(
      onTap: () {
        // 创建 AggregateGreatHeadCache 对象并导航到用户详情页
        final story = AggregateGreatHeadCache(
          id: photographer['id'],
          image: photographer['avatar'],
          name: photographer['name'],
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CleanMediocreLayoutArray(user: story),
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
                  color: PausePriorRouteArray.brandSecondary.withOpacity(0.3),
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
                      color: PausePriorRouteArray.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    photographer['title'],
                    style: TextStyle(
                      fontSize: 13,
                      color: PausePriorRouteArray.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.people_rounded,
                        size: 14,
                        color: PausePriorRouteArray.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${photographer['followers']} 关注者',
                        style: TextStyle(
                          fontSize: 12,
                          color: PausePriorRouteArray.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => GetPrevSizeCache(photographer['id']),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  gradient: SetComprehensiveTextType ? null : PausePriorRouteArray.brandGradient,
                  color: SetComprehensiveTextType ? Colors.grey.shade200 : null,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  SetComprehensiveTextType ? '已关注' : '关注',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: SetComprehensiveTextType ? PausePriorRouteArray.textSecondary : Colors.white,
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
