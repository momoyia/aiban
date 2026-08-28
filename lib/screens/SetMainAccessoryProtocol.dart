import 'package:flutter/material.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import 'PauseProtectedMaterialStack.dart';

class AllocateSynchronousPreviewStack extends StatelessWidget {
  const AllocateSynchronousPreviewStack({super.key});

  @override
  Widget build(BuildContext context) {
    final columnTitles = ['光与影的诗意对话', '时光流转的温柔', '天地间的生命旋律'];
    final columnSubtitles = ['用镜头捕捉每一束光线的故事', '定格岁月中最值得珍藏的瞬间', '聆听自然万物最纯粹的声音'];
    final columnDescriptions = [
      '光与影的交织，是摄影艺术最迷人的语言',
      '时光如流水般匆匆而过，但总有一些瞬间值得被永远珍藏',
      '大自然是最伟大的艺术家，它用四季的变换创造出无数令人惊叹的画面'
    ];
    final columnCovers = [
      'assets/images/work4.jpg',
      'assets/images/work5.jpg',
      'assets/images/work6.jpg'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: PausePriorRouteArray.textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '全部专栏',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PausePriorRouteArray.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: columnTitles.length,
        itemBuilder: (context, index) {
          return StopPublicObserverContainer(
            context,
            columnTitles[index],
            columnSubtitles[index],
            columnDescriptions[index],
            columnCovers[index],
            index,
          );
        },
      ),
    );
  }

  Widget StopPublicObserverContainer(
    BuildContext context,
    String title,
    String subtitle,
    String description,
    String coverImage,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AggregateMediocreBottomType(
              title: title,
              subtitle: subtitle,
              coverImage: coverImage,
              columnIndex: index,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 封面图
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      coverImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                          child: const Icon(Icons.image_rounded, size: 48),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: PausePriorRouteArray.brandGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.collections_rounded,
                                color: Colors.white,
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '专栏',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
            // 内容
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: PausePriorRouteArray.textPrimary,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: PausePriorRouteArray.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: PausePriorRouteArray.textTertiary,
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: PausePriorRouteArray.brandSecondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.article_rounded,
                              size: 14,
                              color: PausePriorRouteArray.brandSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '12篇',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: PausePriorRouteArray.brandSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.remove_red_eye_rounded,
                              size: 14,
                              color: PausePriorRouteArray.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '2.3k',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: PausePriorRouteArray.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
