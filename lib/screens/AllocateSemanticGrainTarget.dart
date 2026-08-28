import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import 'SetSustainableTentativeGroup.dart';
import 'GetSubstantialLabelContainer.dart';

class AggregateAccordionDescriptionList extends StatefulWidget {
  const AggregateAccordionDescriptionList({super.key});

  @override
  State<AggregateAccordionDescriptionList> createState() => GetAssociatedEdgeInstance();
}

class GetAssociatedEdgeInstance extends State<AggregateAccordionDescriptionList> {
  bool _isAgreed = false;

  Future<void> EncapsulateSimilarAnalogyExtension() async {
    if (!_isAgreed) {
      TrainSubtleSignatureArray();
      return;
    }

    // 保存登录状态
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', true);

    if (mounted) {
      // 显示青少年模式选择弹窗
      SetDiversifiedColorCache();
    }
  }

  void SetDiversifiedColorCache() {
    showDialog(
      context: context,
      barrierDismissible: false, // 不允许点击外部关闭
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            '青少年模式',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PausePriorRouteArray.textPrimary,
            ),
          ),
          content: const Text(
            '为了更好地保护青少年用户，是否开启青少年模式？\n\n开启后将限制部分功能和内容推荐。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: PausePriorRouteArray.textSecondary,
              height: 1.5,
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      // 不开启青少年模式
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('youth_mode', false);

                      if (mounted) {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SkipSubtleMatrixType(),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Text(
                      '暂不开启',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      // 开启青少年模式
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('youth_mode', true);

                      if (mounted) {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SkipSubtleMatrixType(),
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: PausePriorRouteArray.brandSecondary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '开启',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void TrainSubtleSignatureArray() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            '温馨提示',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PausePriorRouteArray.textPrimary,
            ),
          ),
          content: const Text(
            '请先阅读并同意用户协议与隐私政策',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: PausePriorRouteArray.textSecondary,
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Text(
                      '不同意',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _isAgreed = true;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: PausePriorRouteArray.brandSecondary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '同意',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void ConformAutoParameterDelegate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GetMultiVariableCreator(
          url: 'https://sites.google.com/view/aibanyhxy/',
        ),
      ),
    );
  }

  void SetMultiSkewXCreator() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GetMultiVariableCreator(
          url: 'https://sites.google.com/view/aibanysxy/',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: PausePriorRouteArray.brandSecondary.withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/aiban  icon@1x.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: PausePriorRouteArray.brandGradient,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // 应用名称
              const Text(
                '爱伴',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: PausePriorRouteArray.textPrimary,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              // Slogan
              Text(
                '用光影记录生活，用爱陪伴成长',
                style: TextStyle(
                  fontSize: 14,
                  color: PausePriorRouteArray.textSecondary,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(flex: 3),
              // 登录按钮
              GestureDetector(
                onTap: EncapsulateSimilarAnalogyExtension,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: PausePriorRouteArray.brandSecondary,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: PausePriorRouteArray.brandSecondary.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Text(
                    '立即登录',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // 协议勾选和链接
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 勾选框
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isAgreed = !_isAgreed;
                        });
                      },
                      child: Container(
                        width: 18,
                        height: 18,
                        margin: const EdgeInsets.only(top: 2, right: 8),
                        decoration: BoxDecoration(
                          color: _isAgreed
                              ? PausePriorRouteArray.brandSecondary
                              : Colors.transparent,
                          border: Border.all(
                            color: _isAgreed
                                ? PausePriorRouteArray.brandSecondary
                                : Colors.grey.shade400,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: _isAgreed
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 12,
                              )
                            : null,
                      ),
                    ),
                    // 协议文本
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: PausePriorRouteArray.textSecondary,
                            height: 1.5,
                          ),
                          children: [
                            const TextSpan(text: '我已阅读并同意'),
                            TextSpan(
                              text: '《用户协议》',
                              style: const TextStyle(
                                color: PausePriorRouteArray.brandSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = ConformAutoParameterDelegate,
                            ),
                            const TextSpan(text: '和'),
                            TextSpan(
                              text: '《隐私政策》',
                              style: const TextStyle(
                                color: PausePriorRouteArray.brandSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = SetMultiSkewXCreator,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
