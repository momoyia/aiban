import 'dart:ui';
import 'package:flutter/material.dart';
import 'DetachBasicScaleManager.dart';
import 'LocateReusableNumberDecorator.dart';
import 'PrepareEphemeralLogarithmHelper.dart';
import 'TrainAgileVarOwner.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';

class SkipSubtleMatrixType extends StatefulWidget {
  const SkipSubtleMatrixType({super.key});

  @override
  State<SkipSubtleMatrixType> createState() => GetLastTextList();
}

class GetLastTextList extends State<SkipSubtleMatrixType> {
  int _currentIndex = 0;
  final GlobalKey<GetPrismaticConvolutionDecorator> _profileKey =
      GlobalKey<GetPrismaticConvolutionDecorator>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      GetElasticTrajectoryType(onPostCreated: ContinueBasicChapterCollection),
      const RetainRobustDepthReference(),
      const StartEasyShapeDecorator(),
      PauseOriginalStyleImplement(key: _profileKey),
    ];
  }

  void ContinueBasicChapterCollection() {
    // 发布作品后刷新个人资料页面
    _profileKey.currentState?.GetNextChallengeType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: DifferentiatePivotalActionType(),
          ),
        ],
      ),
    );
  }

  Widget DifferentiatePivotalActionType() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PausePrevLeftType(0, Icons.home_rounded, '首页'),
              PausePrevLeftType(1, Icons.search_rounded, '探索'),
              PausePrevLeftType(2, Icons.chat_bubble_rounded, '消息'),
              PausePrevLeftType(3, Icons.person_rounded, '我的'),
            ],
          ),
        ),
      ),
    );
  }

  Widget PausePrevLeftType(int index, IconData icon, String label) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: SizedBox(
        width: 64,
        child: Center(
          child: Icon(
            icon,
            size: 22,
            color: isActive ? PausePriorRouteArray.brandSecondary : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
