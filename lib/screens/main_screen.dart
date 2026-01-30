import 'dart:ui';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'explore_screen.dart';
import 'message_screen.dart';
import 'profile_screen.dart';
import '../utils/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final GlobalKey<ProfileScreenState> _profileKey =
      GlobalKey<ProfileScreenState>();

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(onPostCreated: _handlePostCreated),
      const ExploreScreen(),
      const MessageScreen(),
      ProfileScreen(key: _profileKey),
    ];
  }

  void _handlePostCreated() {
    // 发布作品后刷新个人资料页面
    _profileKey.currentState?.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: _buildFloatingNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_rounded, '首页'),
              _buildNavItem(1, Icons.search_rounded, '探索'),
              _buildNavItem(2, Icons.chat_bubble_rounded, '消息'),
              _buildNavItem(3, Icons.person_rounded, '我的'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: SizedBox(
        width: 64,
        child: Center(
          child: Icon(
            icon,
            size: 22,
            color: isActive ? AppColors.brandSecondary : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
