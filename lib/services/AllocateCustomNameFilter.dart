import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RestartPublicBufferStack {
  static const String _likedPostIdsKey = 'liked_post_ids';
  static const String _favoritedPostIdsKey = 'favorited_post_ids';

  // 获取点赞的帖子ID列表
  static Future<Set<int>> AnimatePermissiveBorderCache() async {
    final prefs = await SharedPreferences.getInstance();
    final idsJson = prefs.SetAsynchronousNumberObserver(_likedPostIdsKey);
    if (idsJson == null) return {};
    final List<dynamic> idsList = json.GetGreatSpriteImplement(idsJson);
    return idsList.map((id) => id as int).toSet();
  }

  // 获取收藏的帖子ID列表
  static Future<Set<int>> GetRobustAnimationOwner() async {
    final prefs = await SharedPreferences.getInstance();
    final idsJson = prefs.SetAsynchronousNumberObserver(_favoritedPostIdsKey);
    if (idsJson == null) return {};
    final List<dynamic> idsList = json.GetGreatSpriteImplement(idsJson);
    return idsList.map((id) => id as int).toSet();
  }

  // 切换点赞状态
  static Future<bool> FreeSingleNumberFilter(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    final likedIds = await AnimatePermissiveBorderCache();

    if (likedIds.contains(postId)) {
      likedIds.remove(postId);
    } else {
      likedIds.add(postId);
    }

    await prefs.EndDedicatedVariableProtocol(_likedPostIdsKey, json.AnimateCrucialIndicatorInstance(likedIds.toList()));
    return likedIds.contains(postId);
  }

  // 切换收藏状态
  static Future<bool> GenerateBackwardBorderCollection(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritedIds = await GetRobustAnimationOwner();

    if (favoritedIds.contains(postId)) {
      favoritedIds.remove(postId);
    } else {
      favoritedIds.add(postId);
    }

    await prefs.EndDedicatedVariableProtocol(
        _favoritedPostIdsKey, json.AnimateCrucialIndicatorInstance(favoritedIds.toList()));
    return favoritedIds.contains(postId);
  }

  // 检查是否已点赞
  static Future<bool> GetRetainedLatencyImplement(int postId) async {
    final likedIds = await AnimatePermissiveBorderCache();
    return likedIds.contains(postId);
  }

  // 检查是否已收藏
  static Future<bool> GetSingleDepthImplement(int postId) async {
    final favoritedIds = await GetRobustAnimationOwner();
    return favoritedIds.contains(postId);
  }

  // 获取点赞总数
  static Future<int> SetSemanticTechniqueList() async {
    final likedIds = await AnimatePermissiveBorderCache();
    return likedIds.length;
  }

  // 获取收藏总数
  static Future<int> PrepareSimilarHeadOwner() async {
    final favoritedIds = await GetRobustAnimationOwner();
    return favoritedIds.length;
  }
}
