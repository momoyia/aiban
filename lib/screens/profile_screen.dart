import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../data/mock_data.dart';
import '../models/post.dart';
import '../utils/app_colors.dart';
import '../services/likes_favorites_service.dart';
import '../services/post_service.dart';
import 'post_detail_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  List<String> myWorks = [];
  Set<int> likedPostIds = {};
  Set<int> favoritedPostIds = {};
  int selectedTab = 0;
  final ImagePicker _picker = ImagePicker();
  File? _avatarImage;

  // 用户资料
  String userName = '光影诗人';
  String userBio = '光影捕手 | 独立摄影师';
  String userDescription = '用镜头记录生活中的不期而遇。喜欢街拍，喜欢日落。📷✨';
  String userGender = '保密';
  String userLocation = '中国 上海';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadData();
    _loadUserProfile();
    _clearExampleLikes(); // 清除可能存在的示例点赞数据
  }

  // 清除示例点赞数据的方法
  Future<void> _clearExampleLikes() async {
    // 如果需要清除所有点赞数据，可以取消注释下面的代码
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('liked_post_ids');
    // await prefs.remove('favorited_post_ids');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // 当应用恢复时刷新数据
      _loadData();
    }
  }

  // 移除 didChangeDependencies 和 didUpdateWidget 中的自动刷新
  // 这些方法可能导致无限循环

  // 添加一个公共方法来刷新数据，可以被外部调用
  void refreshData() {
    _loadData();
  }

  void _loadData() async {
    final liked = await LikesFavoritesService.getLikedPostIds();
    final favorited = await LikesFavoritesService.getFavoritedPostIds();
    final userPosts = await PostService.getMyPosts();

    if (mounted) {
      setState(() {
        myWorks = userPosts; // 只显示用户实际发布的作品，不显示示例
        likedPostIds = liked;
        favoritedPostIds = favorited;
      });
    }
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? '光影诗人';
      userBio = prefs.getString('user_bio') ?? '光影捕手 | 独立摄影师';
      userDescription =
          prefs.getString('user_description') ?? '用镜头记录生活中的不期而遇。喜欢街拍，喜欢日落。📷✨';
      userGender = prefs.getString('user_gender') ?? '保密';
      userLocation = prefs.getString('user_location') ?? '中国 上海';

      // 加载头像路径
      final avatarPath = prefs.getString('user_avatar_path');
      if (avatarPath != null && avatarPath.isNotEmpty) {
        _avatarImage = File(avatarPath);
      }
    });
  }

  Future<void> _pickAvatar() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_avatar_path', image.path);

        setState(() {
          _avatarImage = File(image.path);
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('头像已更新'),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('选择头像失败: $e')),
        );
      }
    }
  }

  void _showEditProfileSheet() {
    final nameController = TextEditingController(text: userName);
    final bioController = TextEditingController(text: userBio);
    final descriptionController = TextEditingController(text: userDescription);
    final genderController = TextEditingController(text: userGender);
    final locationController = TextEditingController(text: userLocation);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (modalContext) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(modalContext);
                    },
                    child: Text(
                      '取消',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const Text(
                    '编辑资料',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      // 保存临时变量
                      final savedName = nameController.text;
                      final savedBio = bioController.text;
                      final savedDescription = descriptionController.text;
                      final savedGender = genderController.text;
                      final savedLocation = locationController.text;

                      // 先关闭弹窗
                      Navigator.pop(modalContext);

                      // 保存数据到 SharedPreferences
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('user_name', savedName);
                      await prefs.setString('user_bio', savedBio);
                      await prefs.setString(
                          'user_description', savedDescription);
                      await prefs.setString('user_gender', savedGender);
                      await prefs.setString('user_location', savedLocation);

                      // 更新状态
                      if (mounted) {
                        setState(() {
                          userName = savedName;
                          userBio = savedBio;
                          userDescription = savedDescription;
                          userGender = savedGender;
                          userLocation = savedLocation;
                        });

                        // 显示成功提示
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('资料已保存'),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(16),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      '保存',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brandSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 头像
                    Center(
                      child: GestureDetector(
                        onTap: _pickAvatar,
                        child: Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(4),
                              child: ClipOval(
                                child: _avatarImage != null
                                    ? Image.file(
                                        _avatarImage!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/images/profile_avatar.jpg',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey.shade200,
                                            child: Icon(
                                              Icons.person_rounded,
                                              size: 48,
                                              color: Colors.grey.shade400,
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: AppColors.brandGradient,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.brandPrimary
                                          .withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // 用户名
                    _buildEditFieldWithController('用户名', nameController),
                    const SizedBox(height: 20),
                    // 简介
                    _buildEditFieldWithController('简介', bioController),
                    const SizedBox(height: 20),
                    // 个人介绍
                    _buildEditFieldWithController('个人介绍', descriptionController,
                        maxLines: 3),
                    const SizedBox(height: 20),
                    // 性别
                    _buildEditFieldWithController('性别', genderController),
                    const SizedBox(height: 20),
                    // 地区
                    _buildEditFieldWithController('地区', locationController),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildHeader(),
          _buildProfileInfo(),
          _buildStats(),
          _buildTabs(),
          _buildWorksGrid(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 56, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.settings_rounded,
                color: Colors.grey.shade800,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(4),
                  child: ClipOval(
                    child: _avatarImage != null
                        ? Image.file(
                            _avatarImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/profile_avatar.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade200,
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 48,
                                  color: Colors.grey.shade400,
                                ),
                              );
                            },
                          ),
                  ),
                ),
                GestureDetector(
                  onTap: _showEditProfileSheet,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.brandGradient,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.brandPrimary.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Text(
                      '编辑资料',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              userBio,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                userDescription,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textTertiary,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStats() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Row(
          children: [
            _buildStatItem('1,208', '关注'),
            const SizedBox(width: 32),
            _buildStatItem('8.5k', '粉丝'),
            const SizedBox(width: 32),
            _buildStatItem('32w', '获赞'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        margin: const EdgeInsets.only(top: 32, bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade100, width: 1),
          ),
        ),
        child: Row(
          children: [
            _buildTab(Icons.grid_on_rounded, 0),
            const SizedBox(width: 32),
            _buildTab(Icons.favorite_rounded, 1),
            const SizedBox(width: 32),
            _buildTab(Icons.bookmark_rounded, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(IconData icon, int index) {
    final isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
        // 切换标签时刷新数据，确保显示最新的点赞和收藏状态
        _loadData();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.brandPrimary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isSelected ? AppColors.brandPrimary : AppColors.textSecondary,
        ),
      ),
    );
  }

  Future<void> _deleteWork(String imagePath) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '删除作品',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: const Text(
          '确定要删除这个作品吗？删除后无法恢复。',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              '取消',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              '删除',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await PostService.deletePost(imagePath);
      _loadData(); // 刷新数据
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('作品已删除'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildWorksGrid() {
    final allPosts = MockData.getFeedPosts();

    // 根据选中的tab显示不同的内容
    List<Post> displayPosts = [];

    if (selectedTab == 0) {
      // 我的作品 - 包括用户发布的作品和匹配的现有帖子
      displayPosts = [];

      for (String imagePath in myWorks) {
        // 先尝试从现有帖子中找到匹配的
        final matchingPosts = allPosts.where((post) => post.image == imagePath);

        if (matchingPosts.isNotEmpty) {
          displayPosts.add(matchingPosts.first);
        } else {
          // 如果没有找到匹配的帖子，创建一个新的帖子对象
          displayPosts.add(Post(
            id: DateTime.now().millisecondsSinceEpoch, // 使用时间戳作为ID
            user: userName,
            avatar: _avatarImage?.path ?? 'assets/images/profile_avatar.jpg',
            image: imagePath,
            title: '我的作品',
            likes: 0,
            isLiked: false,
            location: userLocation,
            description: '用心创作的每一刻都值得被记录',
            comments: [],
          ));
        }
      }
    } else if (selectedTab == 1) {
      // 点赞的帖子 - 只显示用户实际点赞的帖子
      if (likedPostIds.isNotEmpty) {
        displayPosts =
            allPosts.where((post) => likedPostIds.contains(post.id)).toList();
      }
      // 如果没有点赞的帖子，displayPosts 保持为空列表
    } else if (selectedTab == 2) {
      // 收藏的帖子 - 只显示用户实际收藏的帖子
      if (favoritedPostIds.isNotEmpty) {
        displayPosts = allPosts
            .where((post) => favoritedPostIds.contains(post.id))
            .toList();
      }
      // 如果没有收藏的帖子，displayPosts 保持为空列表
    }

    if (displayPosts.isEmpty) {
      return SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Icon(
                selectedTab == 0
                    ? Icons.grid_on_rounded
                    : selectedTab == 1
                        ? Icons.favorite_border_rounded
                        : Icons.bookmark_border_rounded,
                size: 64,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 16),
              Text(
                selectedTab == 0
                    ? '还没有发布作品'
                    : selectedTab == 1
                        ? '还没有点赞的内容'
                        : '还没有收藏的内容',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildListDelegate([
        // 作品网格
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemCount: displayPosts.length,
            itemBuilder: (context, index) {
              final post = displayPosts[index];

              // 检查是否是默认的引导图片（work1.jpg - work9.jpg）
              final isDefaultWork = post.image.contains('work') &&
                  RegExp(r'work[1-9]\.jpg').hasMatch(post.image);

              return GestureDetector(
                onTap: isDefaultWork
                    ? null
                    : () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailScreen(post: post),
                          ),
                        );
                        // 返回时刷新数据
                        _loadData();
                      },
                onLongPress: selectedTab == 0 && !isDefaultWork
                    ? () => _deleteWork(post.image)
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        post.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: Icon(
                              Icons.image_rounded,
                              color: Colors.grey.shade400,
                              size: 32,
                            ),
                          );
                        },
                      ),
                      // 如果是默认图片，显示半透明遮罩和提示
                      if (isDefaultWork)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                '示例',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

Widget _buildEditFieldWithController(
    String label, TextEditingController controller,
    {int maxLines = 1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.textPrimary,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
        ),
      ),
    ],
  );
}
