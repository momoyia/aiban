import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PostService {
  static const String _myPostsKey = 'my_posts';

  // 获取我的帖子图片列表
  static Future<List<String>> getMyPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final postsJson = prefs.getString(_myPostsKey);
    if (postsJson == null) return [];
    final List<dynamic> postsList = json.decode(postsJson);
    return postsList.map((item) => item as String).toList();
  }

  // 添加新帖子
  static Future<void> addPost(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    final posts = await getMyPosts();
    posts.insert(0, imagePath); // 添加到列表开头
    await prefs.setString(_myPostsKey, json.encode(posts));
  }

  // 删除帖子
  static Future<void> deletePost(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    final posts = await getMyPosts();
    posts.remove(imagePath);
    await prefs.setString(_myPostsKey, json.encode(posts));
  }
}
