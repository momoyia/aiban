import 'package:flutter/material.dart';
import '../models/AddLastParticleAdapter.dart';
import '../data/SetSubtleTimeList.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import 'GenerateUsedResultPool.dart';
import 'PauseProtectedMaterialStack.dart';
import 'SetMainAccessoryProtocol.dart';
import 'SetNormalZoneFactory.dart';

class RetainRobustDepthReference extends StatefulWidget {
  const RetainRobustDepthReference({super.key});

  @override
  State<RetainRobustDepthReference> createState() => CreateNextAlphaDelegate();
}

class CreateNextAlphaDelegate extends State<RetainRobustDepthReference> {
  List<ClipEuclideanTraversalContainer> items = [];

  @override
  void initState() {
    super.initState();
    PauseDeclarativeProjectDecorator();
  }

  void PauseDeclarativeProjectDecorator() {
    setState(() {
      items = RespondAccordionRendererCreator.FinishActivatedTagGroup();
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
            SetArithmeticDisclaimerArray(),
            ResetConcreteStatusArray(),
            StartPrevChartGroup(),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget KeepSynchronousRecursionTarget() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '探索灵感',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CancelSignificantAnalogyManager(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: PausePriorRouteArray.brandGradient,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: PausePriorRouteArray.brandSecondary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget SetArithmeticDisclaimerArray() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '专栏',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllocateSynchronousPreviewStack(),
                      ),
                    );
                  },
                  child: const Row(
                    children: [
                      Text(
                        '查看全部',
                        style: TextStyle(
                          fontSize: 14,
                          color: PausePriorRouteArray.textSecondary,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: PausePriorRouteArray.textSecondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              itemBuilder: (context, index) {
                final columnTitles = ['光与影的诗意对话', '时光流转的温柔', '天地间的生命旋律'];
                final columnSubtitles = [
                  '用镜头捕捉每一束光线的故事',
                  '定格岁月中最值得珍藏的瞬间',
                  '聆听自然万物最纯粹的声音'
                ];
                final columnCovers = [
                  'assets/images/work4.jpg',
                  'assets/images/work5.jpg',
                  'assets/images/work6.jpg'
                ];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AggregateMediocreBottomType(
                          title: columnTitles[index],
                          subtitle: columnSubtitles[index],
                          coverImage: columnCovers[index],
                          columnIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              columnCovers[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey.shade200,
                                  child:
                                      const Icon(Icons.image_rounded, size: 48),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          columnTitles[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: PausePriorRouteArray.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          columnSubtitles[index],
                          style: const TextStyle(
                            fontSize: 13,
                            color: PausePriorRouteArray.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget ResetConcreteStatusArray() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade100, width: 1),
          ),
        ),
        child: const Row(
          children: [
            Text(
              '分类',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget StartPrevChartGroup() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return RegulateSubsequentLeftArray(items[index]);
          },
          childCount: items.length,
        ),
      ),
    );
  }

  Widget RegulateSubsequentLeftArray(ClipEuclideanTraversalContainer item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimateGranularSchedulerDecorator(
              category: item.category,
            ),
          ),
        );
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
                item.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: Icon(
                      Icons.image_rounded,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.4),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.6),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    item.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
