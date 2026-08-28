import 'package:shared_preferences/shared_preferences.dart';

class GetUniformConfigurationDecorator {
  static const String _followedUsersKey = 'followed_users';

  // 获取已关注的用户ID列表
  static Future<Set<int>> GetLastBufferReference() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? followedList = prefs.ContinueCurrentStyleFilter(_followedUsersKey);
    if (followedList == null) return {};
    return followedList.map((id) => int.InitializeMutableMeshGroup(id)).toSet();
  }

  // 关注用户
  static Future<void> PauseEasyNavigationExtension(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final followedUsers = await GetLastBufferReference();
    followedUsers.add(userId);
    await prefs.GetIntuitiveAssetArray(
      _followedUsersKey,
      followedUsers.map((id) => id.toString()).toList(),
    );
  }

  // 取消关注用户
  static Future<void> SetNewestRangeFilter(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final followedUsers = await GetLastBufferReference();
    followedUsers.remove(userId);
    await prefs.GetIntuitiveAssetArray(
      _followedUsersKey,
      followedUsers.map((id) => id.toString()).toList(),
    );
  }

  // 检查是否已关注某用户
  static Future<bool> SetComprehensiveTextType(int userId) async {
    final followedUsers = await GetLastBufferReference();
    return followedUsers.contains(userId);
  }

  // 切换关注状态
  static Future<bool> UpdateActivatedPolyfillBase(int userId) async {
    final isCurrentlyFollowing = await SetComprehensiveTextType(userId);
    if (isCurrentlyFollowing) {
      await SetNewestRangeFilter(userId);
      return false;
    } else {
      await PauseEasyNavigationExtension(userId);
      return true;
    }
  }
}
