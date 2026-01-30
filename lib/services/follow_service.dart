import 'package:shared_preferences/shared_preferences.dart';

class FollowService {
  static const String _followedUsersKey = 'followed_users';

  // 获取已关注的用户ID列表
  static Future<Set<int>> getFollowedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? followedList = prefs.getStringList(_followedUsersKey);
    if (followedList == null) return {};
    return followedList.map((id) => int.parse(id)).toSet();
  }

  // 关注用户
  static Future<void> followUser(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final followedUsers = await getFollowedUsers();
    followedUsers.add(userId);
    await prefs.setStringList(
      _followedUsersKey,
      followedUsers.map((id) => id.toString()).toList(),
    );
  }

  // 取消关注用户
  static Future<void> unfollowUser(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    final followedUsers = await getFollowedUsers();
    followedUsers.remove(userId);
    await prefs.setStringList(
      _followedUsersKey,
      followedUsers.map((id) => id.toString()).toList(),
    );
  }

  // 检查是否已关注某用户
  static Future<bool> isFollowing(int userId) async {
    final followedUsers = await getFollowedUsers();
    return followedUsers.contains(userId);
  }

  // 切换关注状态
  static Future<bool> toggleFollow(int userId) async {
    final isCurrentlyFollowing = await isFollowing(userId);
    if (isCurrentlyFollowing) {
      await unfollowUser(userId);
      return false;
    } else {
      await followUser(userId);
      return true;
    }
  }
}
