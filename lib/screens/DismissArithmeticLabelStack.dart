import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import 'AllocateSemanticGrainTarget.dart';
import 'SetSustainableTentativeGroup.dart';

class EndRequiredTaskObserver extends StatefulWidget {
  const EndRequiredTaskObserver({super.key});

  @override
  State<EndRequiredTaskObserver> createState() => SetSmartVideoExtension();
}

class SetSmartVideoExtension extends State<EndRequiredTaskObserver> {
  @override
  void initState() {
    super.initState();
    AppendAutoPopupType();
  }

  Future<void> AppendAutoPopupType() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // 检查是否已登录
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('is_logged_in') ?? false;

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isLoggedIn ? const SkipSubtleMatrixType() : const AggregateAccordionDescriptionList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo图标
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: PausePriorRouteArray.brandSecondary.withOpacity(0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/aiban  icon@1x.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // 如果logo图片不存在，显示默认图标
                    return Container(
                      decoration: BoxDecoration(
                        gradient: PausePriorRouteArray.brandGradient,
                      ),
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 60,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
