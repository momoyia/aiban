import 'package:flutter/material.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';

class SkipSimilarStrengthList extends StatelessWidget {
  const SkipSimilarStrengthList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: PausePriorRouteArray.textPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '获赞和收藏',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PausePriorRouteArray.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    PausePriorRouteArray.brandPrimary.withOpacity(0.1),
                    PausePriorRouteArray.brandSecondary.withOpacity(0.1),
                  ],
                ),
              ),
              child: Icon(
                Icons.favorite_rounded,
                size: 60,
                color: PausePriorRouteArray.brandPrimary.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '还没有人给你点赞哦',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '发布更多精彩作品，获得更多关注',
              style: TextStyle(
                fontSize: 14,
                color: PausePriorRouteArray.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
