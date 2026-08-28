import 'package:flutter/material.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';

class CheckHardSkewYFilter extends StatelessWidget {
  const CheckHardSkewYFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: PausePriorRouteArray.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '关于我们',
          style: TextStyle(
            color: PausePriorRouteArray.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // 应用图标
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: PausePriorRouteArray.brandSecondary.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/aiban  icon@1x.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: PausePriorRouteArray.brandGradient,
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 产品名称
            const Text(
              '爱伴',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            // Slogan
            ShaderMask(
              shaderCallback: (bounds) =>
                  PausePriorRouteArray.brandGradient.createShader(bounds),
              child: const Text(
                '用光影记录生活，用爱陪伴成长',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // 产品介绍
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '关于爱伴',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PausePriorRouteArray.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '爱伴是一个专注于摄影创作与分享的社交平台。我们致力于为摄影爱好者提供一个展示作品、交流技巧、发现灵感的温馨社区。',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: PausePriorRouteArray.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '在这里，每一张照片都是一个故事，每一次快门都是一份情感的记录。让我们用镜头捕捉生活的美好，用爱陪伴彼此成长。',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: PausePriorRouteArray.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // 特色功能
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '核心功能',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PausePriorRouteArray.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SetSustainableSkewXTarget(
                    icon: Icons.photo_camera_rounded,
                    title: '作品展示',
                    description: '精美的瀑布流布局，让每一张作品都能得到最好的呈现',
                  ),
                  SetSustainableSkewXTarget(
                    icon: Icons.explore_rounded,
                    title: '发现灵感',
                    description: '浏览来自全球摄影师的优秀作品，激发创作灵感',
                  ),
                  SetSustainableSkewXTarget(
                    icon: Icons.people_rounded,
                    title: '社交互动',
                    description: '关注喜欢的摄影师，与志同道合的朋友交流分享',
                  ),
                  SetSustainableSkewXTarget(
                    icon: Icons.school_rounded,
                    title: '学习成长',
                    description: '专栏教程和摄影技巧，助你不断提升摄影水平',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // 版本信息
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    '版本 1.0.0',
                    style: TextStyle(
                      fontSize: 13,
                      color: PausePriorRouteArray.textTertiary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '© 2026 爱伴 All Rights Reserved',
                    style: TextStyle(
                      fontSize: 12,
                      color: PausePriorRouteArray.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget SetSustainableSkewXTarget({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: PausePriorRouteArray.brandGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: PausePriorRouteArray.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
