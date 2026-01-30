import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../utils/app_colors.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({
    super.key,
    required this.url,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
            // 隐藏所有不必要的UI元素
            _controller.runJavaScript('''
              // 隐藏Google Sites的所有导航和UI元素
              var elementsToHide = [
                'header', 'footer', 'nav', '.nav', '[role="navigation"]',
                '.sites-header-cell-buffer', '[data-tooltip*="编辑"]', '[data-tooltip*="Edit"]',
                '[role="button"][aria-label*="信息"]', '[role="button"][aria-label*="Information"]',
                '.info-icon', '[class*="info"]', '[data-tooltip*="信息"]', '[data-tooltip*="Information"]',
                'button[style*="border-radius"]', '[role="button"][style*="border-radius"]',
                '.circle-button', '[class*="circle"]', '[class*="sites-"]', '[id*="sites-"]',
                '[data-*="sites"]', '[style*="position: fixed"]', '[style*="position: absolute"]',
                '[style*="z-index"]'
              ];
              
              elementsToHide.forEach(function(selector) {
                var elements = document.querySelectorAll(selector);
                elements.forEach(function(el) {
                  if (el.tagName === 'BUTTON' || el.getAttribute('role') === 'button' || 
                      el.innerHTML.includes('i') || el.innerHTML.includes('I') ||
                      parseInt(el.style.zIndex) > 100) {
                    el.style.display = 'none';
                  }
                });
              });
              
              // 调整内容区域
              var content = document.querySelector('[role="main"]') || document.querySelector('.sites-canvas-main');
              if (content) {
                content.style.padding = '20px';
                content.style.margin = '0';
                content.style.maxWidth = '100%';
                content.style.paddingBottom = '40px';
              }
              
              // 隐藏底部固定元素
              var bottomElements = document.querySelectorAll('*');
              bottomElements.forEach(function(el) {
                var rect = el.getBoundingClientRect();
                if (rect.bottom > window.innerHeight - 100 && 
                    (el.tagName === 'BUTTON' || el.getAttribute('role') === 'button')) {
                  el.style.display = 'none';
                }
              });
            ''');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _closeWebView() {
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: _closeWebView,
          icon: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.close,
              color: AppColors.textPrimary,
              size: 20,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          // WebView内容
          WebViewWidget(controller: _controller),
          // 加载指示器
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.brandSecondary,
              ),
            ),
        ],
      ),
    );
  }
}
