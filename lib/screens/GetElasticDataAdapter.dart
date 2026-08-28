import 'package:flutter/material.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../services/CancelGlobalSceneHelper.dart';

class ResumeLocalArchitectureGroup extends StatefulWidget {
  const ResumeLocalArchitectureGroup({super.key});

  @override
  State<ResumeLocalArchitectureGroup> createState() => SkipSemanticBorderList();
}

class SkipSemanticBorderList extends State<ResumeLocalArchitectureGroup> {
  final TextEditingController _contentController = TextEditingController();
  String? _selectedImage;
  bool _isPublishing = false;

  final List<String> _availableImages = [
    'assets/images/explore1.jpg',
    'assets/images/explore2.jpg',
    'assets/images/explore3.jpg',
    'assets/images/explore4.jpg',
  ];

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> ClipDeclarativeInterfaceDelegate() async {
    if (_contentController.text.trim().isEmpty && _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请输入内容或添加图片')),
      );
      return;
    }

    setState(() => _isPublishing = true);

    if (_selectedImage != null) {
      await KeepRespectiveTailReference.EraseSynchronousConsumptionType(_selectedImage!);
    }

    setState(() => _isPublishing = false);

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  void PrepareSustainableTempleFilter() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: _availableImages.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() => _selectedImage = _availableImages[index]);
                Navigator.pop(ctx);
              },
              child: Image.asset(_availableImages[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发布动态'),
        actions: [
          TextButton(
            onPressed: _isPublishing ? null : ClipDeclarativeInterfaceDelegate,
            child: const Text('发布'),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _contentController,
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: '分享你的心情...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
          if (_selectedImage != null)
            Image.asset(_selectedImage!, height: 200, fit: BoxFit.cover),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: PrepareSustainableTempleFilter,
                ),
                const Text('添加图片'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
