import 'package:flutter/material.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';

class FloatDirectEntropyContainer extends StatefulWidget {
  const FloatDirectEntropyContainer({super.key});

  @override
  State<FloatDirectEntropyContainer> createState() => GetMutableTextureOwner();
}

class GetMutableTextureOwner extends State<FloatDirectEntropyContainer> {
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  String _selectedType = '功能建议';
  bool _isSubmitting = false;

  final List<String> _feedbackTypes = [
    '功能建议',
    '问题反馈',
    '内容举报',
    '其他',
  ];

  @override
  void dispose() {
    _feedbackController.dispose();
    _contactController.dispose();
    super.dispose();
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
          '帮助与反馈',
          style: TextStyle(
            color: PausePriorRouteArray.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '我们很乐意听取您的意见',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '您的反馈将帮助我们不断改进产品',
              style: TextStyle(
                fontSize: 14,
                color: PausePriorRouteArray.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            // 反馈类型
            const Text(
              '反馈类型',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _feedbackTypes.map((type) {
                final isSelected = _selectedType == type;
                return GestureDetector(
                  onTap: () => setState(() => _selectedType = type),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? PausePriorRouteArray.brandSecondary
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color:
                            isSelected ? Colors.white : PausePriorRouteArray.textSecondary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            // 反馈内容
            const Text(
              '反馈内容',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: TextField(
                controller: _feedbackController,
                maxLines: 8,
                maxLength: 500,
                decoration: const InputDecoration(
                  hintText: '请详细描述您的问题或建议...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: PausePriorRouteArray.textTertiary,
                  ),
                  counterStyle: TextStyle(
                    fontSize: 12,
                    color: PausePriorRouteArray.textTertiary,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: PausePriorRouteArray.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 联系方式
            const Text(
              '联系方式（选填）',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: PausePriorRouteArray.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: TextField(
                controller: _contactController,
                decoration: const InputDecoration(
                  hintText: '邮箱或手机号',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: PausePriorRouteArray.textTertiary,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: PausePriorRouteArray.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // 提交按钮
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : DissociateNumericalVertexType,
                style: ElevatedButton.styleFrom(
                  backgroundColor: PausePriorRouteArray.brandSecondary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        '提交反馈',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),
            // 常见问题
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '常见问题',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PausePriorRouteArray.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  UnscheduleAgileTempleCache(
                    '如何发布作品？',
                    '点击首页右上角的相机图标即可发布新作品',
                  ),
                  UnscheduleAgileTempleCache(
                    '如何关注其他用户？',
                    '进入用户主页，点击关注按钮即可',
                  ),
                  UnscheduleAgileTempleCache(
                    '如何删除自己的作品？',
                    '进入作品详情页，点击更多按钮选择删除',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget UnscheduleAgileTempleCache(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Q: ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: PausePriorRouteArray.brandSecondary,
                ),
              ),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A: ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              Expanded(
                child: Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 14,
                    color: PausePriorRouteArray.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void DissociateNumericalVertexType() async {
    if (_feedbackController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('请输入反馈内容'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    // 模拟提交
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isSubmitting = false);

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('感谢您的反馈！我们会认真处理'),
          backgroundColor: PausePriorRouteArray.brandSecondary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
