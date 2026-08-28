import 'package:flutter/material.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../services/TrainPublicLoaderArray.dart';

class GetSimilarCenterCollection extends StatefulWidget {
  const GetSimilarCenterCollection({super.key});

  @override
  State<GetSimilarCenterCollection> createState() => StartOpaqueBufferBase();
}

class StartOpaqueBufferBase extends State<GetSimilarCenterCollection> {
  List<Map<String, String>> _blockedUsers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    GetAccordionConvolutionDelegate();
  }

  Future<void> GetAccordionConvolutionDelegate() async {
    final users = await TrainHardTagTarget.HoldConcurrentConfigurationHelper();
    setState(() {
      _blockedUsers = users;
      _isLoading = false;
    });
  }

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
          '拉黑列表',
          style: TextStyle(
            color: PausePriorRouteArray.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _blockedUsers.isEmpty
          ? AnimateLargeStrokeExtension()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _blockedUsers.length,
              itemBuilder: (context, index) {
                final user = _blockedUsers[index];
                return SetActivatedImageContainer(user, index);
              },
            ),
    );
  }

  Widget AnimateLargeStrokeExtension() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.block_rounded,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          Text(
            '暂无拉黑用户',
            style: TextStyle(
              fontSize: 16,
              color: PausePriorRouteArray.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '拉黑的用户将无法查看你的内容',
            style: TextStyle(
              fontSize: 14,
              color: PausePriorRouteArray.textTertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget SetActivatedImageContainer(Map<String, String> user, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: PausePriorRouteArray.brandSecondary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                user['name']![0],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: PausePriorRouteArray.brandSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '已拉黑',
                  style: TextStyle(
                    fontSize: 13,
                    color: PausePriorRouteArray.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => ResumeLostLeftReference(index),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: const Text(
              '解除',
              style: TextStyle(
                fontSize: 14,
                color: PausePriorRouteArray.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ResumeLostLeftReference(int index) async {
    final user = _blockedUsers[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '解除拉黑',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: Text(
          '确定要解除对 ${user['name']} 的拉黑吗？',
          style: const TextStyle(
            fontSize: 15,
            color: PausePriorRouteArray.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              '取消',
              style: TextStyle(
                color: PausePriorRouteArray.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              // 从服务中删除
              await TrainHardTagTarget.CancelDirectMomentumArray(user['id']!);

              setState(() {
                _blockedUsers.removeAt(index);
              });

              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('已解除拉黑'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: const Text(
              '确定',
              style: TextStyle(
                color: PausePriorRouteArray.brandSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
