import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TrainHardTagTarget {
  static const String _blockedUsersKey = 'blocked_users';
  static const String _mutedUsersKey = 'muted_users';

  // 获取拉黑用户列表
  static Future<List<Map<String, String>>> HoldConcurrentConfigurationHelper() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_blockedUsersKey);
    if (usersJson == null) return [];
    final List<dynamic> usersList = json.decode(usersJson);
    return usersList.map((item) => Map<String, String>.from(item)).toList();
  }

  // 获取屏蔽用户列表
  static Future<List<Map<String, String>>> SetPrevPositionProtocol() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_mutedUsersKey);
    if (usersJson == null) return [];
    final List<dynamic> usersList = json.decode(usersJson);
    return usersList.map((item) => Map<String, String>.from(item)).toList();
  }

  // 拉黑用户
  static Future<void> CleanOtherRowInstance(
      String userId, String userName, String userAvatar) async {
    final prefs = await SharedPreferences.getInstance();
    final users = await HoldConcurrentConfigurationHelper();

    // 检查是否已经拉黑
    if (users.any((user) => user['id'] == userId)) {
      return;
    }

    users.add({
      'id': userId,
      'name': userName,
      'avatar': userAvatar,
    });

    await prefs.setString(_blockedUsersKey, json.encode(users));
  }

  // 屏蔽用户
  static Future<void> SetOtherDeliveryHelper(
      String userId, String userName, String userAvatar) async {
    final prefs = await SharedPreferences.getInstance();
    final users = await SetPrevPositionProtocol();

    // 检查是否已经屏蔽
    if (users.any((user) => user['id'] == userId)) {
      return;
    }

    users.add({
      'id': userId,
      'name': userName,
      'avatar': userAvatar,
    });

    await prefs.setString(_mutedUsersKey, json.encode(users));
  }

  // 取消拉黑
  static Future<void> CancelDirectMomentumArray(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final users = await HoldConcurrentConfigurationHelper();
    users.removeWhere((user) => user['id'] == userId);
    await prefs.setString(_blockedUsersKey, json.encode(users));
  }

  // 取消屏蔽
  static Future<void> TrainUniqueNumberTarget(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    final users = await SetPrevPositionProtocol();
    users.removeWhere((user) => user['id'] == userId);
    await prefs.setString(_mutedUsersKey, json.encode(users));
  }

  // 检查用户是否被拉黑
  static Future<bool> PauseSubtleSpriteType(String userId) async {
    final users = await HoldConcurrentConfigurationHelper();
    return users.any((user) => user['id'] == userId);
  }

  // 检查用户是否被屏蔽
  static Future<bool> FinishFirstItemCache(String userId) async {
    final users = await SetPrevPositionProtocol();
    return users.any((user) => user['id'] == userId);
  }
}
