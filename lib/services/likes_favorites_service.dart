import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LikesFavoritesService {
  static const String _likedPostIdsKey = 'liked_post_ids';
  static const String _favoritedPostIdsKey = 'favorited_post_ids';

  // 获取点赞的帖子ID列表
  static Future<Set<int>> getLikedPostIds() async {
    final prefs = await SharedPreferences.getInstance();
    final idsJson = prefs.getString(_likedPostIdsKey);
    if (idsJson == null) return {};
    final List<dynamic> idsList = json.decode(idsJson);
    return idsList.map((id) => id as int).toSet();
  }

  // 获取收藏的帖子ID列表
  static Future<Set<int>> getFavoritedPostIds() async {
    final prefs = await SharedPreferences.getInstance();
    final idsJson = prefs.getString(_favoritedPostIdsKey);
    if (idsJson == null) return {};
    final List<dynamic> idsList = json.decode(idsJson);
    return idsList.map((id) => id as int).toSet();
  }

  // 切换点赞状态
  static Future<bool> toggleLike(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    final likedIds = await getLikedPostIds();

    if (likedIds.contains(postId)) {
      likedIds.remove(postId);
    } else {
      likedIds.add(postId);
    }

    await prefs.setString(_likedPostIdsKey, json.encode(likedIds.toList()));
    return likedIds.contains(postId);
  }

  // 切换收藏状态
  static Future<bool> toggleFavorite(int postId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoritedIds = await getFavoritedPostIds();

    if (favoritedIds.contains(postId)) {
      favoritedIds.remove(postId);
    } else {
      favoritedIds.add(postId);
    }

    await prefs.setString(
        _favoritedPostIdsKey, json.encode(favoritedIds.toList()));
    return favoritedIds.contains(postId);
  }

  // 检查是否已点赞
  static Future<bool> isLiked(int postId) async {
    final likedIds = await getLikedPostIds();
    return likedIds.contains(postId);
  }

  // 检查是否已收藏
  static Future<bool> isFavorited(int postId) async {
    final favoritedIds = await getFavoritedPostIds();
    return favoritedIds.contains(postId);
  }

  // 获取点赞总数
  static Future<int> getLikesCount() async {
    final likedIds = await getLikedPostIds();
    return likedIds.length;
  }

  // 获取收藏总数
  static Future<int> getFavoritesCount() async {
    final favoritedIds = await getFavoritedPostIds();
    return favoritedIds.length;
  }
}
