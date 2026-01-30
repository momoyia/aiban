import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_colors.dart';
import 'about_screen.dart';
import 'blocked_users_screen.dart';
import 'muted_users_screen.dart';
import 'feedback_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _teenMode = false;
  bool _pushNotifications = true;
  bool _autoPlayVideos = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _teenMode = prefs.getBool('youth_mode') ?? false;
      _pushNotifications = prefs.getBool('push_notifications') ?? true;
      _autoPlayVideos = prefs.getBool('auto_play_videos') ?? true;
    });
  }

  Future<void> _saveTeenMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('youth_mode', value);
    setState(() {
      _teenMode = value;
    });
  }

  Future<void> _savePushNotifications(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('push_notifications', value);
    setState(() {
      _pushNotifications = value;
    });
  }

  Future<void> _saveAutoPlayVideos(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('auto_play_videos', value);
    setState(() {
      _autoPlayVideos = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '设置',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          _buildSection(
            title: '隐私与安全',
            children: [
              _buildNavigationItem(
                icon: Icons.block_rounded,
                title: '拉黑列表',
                subtitle: '管理已拉黑的用户',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BlockedUsersScreen(),
                    ),
                  );
                },
              ),
              _buildNavigationItem(
                icon: Icons.visibility_off_rounded,
                title: '屏蔽列表',
                subtitle: '管理已屏蔽的用户',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MutedUsersScreen(),
                    ),
                  );
                },
              ),
              _buildSwitchItem(
                icon: Icons.child_care_rounded,
                title: '青少年模式',
                subtitle: '开启后将限制部分内容',
                value: _teenMode,
                onChanged: (value) {
                  _saveTeenMode(value);
                  if (value) {
                    _showTeenModeDialog();
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSection(
            title: '通知设置',
            children: [
              _buildSwitchItem(
                icon: Icons.notifications_rounded,
                title: '推送通知',
                subtitle: '接收新消息和互动提醒',
                value: _pushNotifications,
                onChanged: _savePushNotifications,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSection(
            title: '播放设置',
            children: [
              _buildSwitchItem(
                icon: Icons.play_circle_outline_rounded,
                title: '自动播放视频',
                subtitle: '在WiFi环境下自动播放',
                value: _autoPlayVideos,
                onChanged: _saveAutoPlayVideos,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSection(
            title: '帮助与支持',
            children: [
              _buildNavigationItem(
                icon: Icons.feedback_rounded,
                title: '帮助与反馈',
                subtitle: '遇到问题？告诉我们',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackScreen(),
                    ),
                  );
                },
              ),
              _buildNavigationItem(
                icon: Icons.info_rounded,
                title: '关于我们',
                subtitle: '了解爱伴',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection(
      {required String title, required List<Widget> children}) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.brandSecondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: AppColors.brandSecondary,
                size: 22,
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
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.brandSecondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.brandSecondary,
              size: 22,
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
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.brandSecondary,
          ),
        ],
      ),
    );
  }

  void _showTeenModeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '青少年模式已开启',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: const Text(
          '青少年模式将为您提供更安全的浏览体验，部分内容将被限制访问。',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              '我知道了',
              style: TextStyle(
                color: AppColors.brandSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
