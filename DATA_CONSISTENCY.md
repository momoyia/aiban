# 数据一致性说明

## 概述
应用使用 SharedPreferences 作为本地存储，确保所有用户操作数据在整个应用中保持一致。

## 数据服务

### 1. 点赞和收藏服务 (LikesFavoritesService)
**存储位置**: `lib/services/likes_favorites_service.dart`

**功能**:
- 点赞/取消点赞帖子
- 收藏/取消收藏帖子
- 查询点赞和收藏状态
- 获取点赞和收藏的帖子ID列表

**使用页面**:
- 首页 (HomeScreen) - 点赞操作和状态同步
- 分类详情页 (CategoryDetailScreen) - 点赞操作和状态同步
- 帖子详情页 (PostDetailScreen) - 点赞和收藏操作
- 个人资料页 (ProfileScreen) - 显示点赞和收藏列表

**数据一致性保证**:
- 所有操作通过 SharedPreferences 持久化存储
- 使用 `toggleLike()` 和 `toggleFavorite()` 方法确保状态切换的原子性
- 页面间通过回调机制同步状态更新

### 2. 拉黑和屏蔽服务 (BlockMuteService)
**存储位置**: `lib/services/block_mute_service.dart`

**功能**:
- 拉黑用户
- 屏蔽用户
- 取消拉黑
- 取消屏蔽
- 获取拉黑和屏蔽用户列表

**使用页面**:
- 帖子详情页 (PostDetailScreen) - 拉黑和屏蔽操作
- 拉黑用户列表页 (BlockedUsersScreen) - 显示和管理拉黑用户
- 屏蔽用户列表页 (MutedUsersScreen) - 显示和管理屏蔽用户
- 首页 (HomeScreen) - 过滤被拉黑/屏蔽用户的帖子
- 分类详情页 (CategoryDetailScreen) - 过滤被拉黑/屏蔽用户的帖子

**数据一致性保证**:
- 所有操作通过 SharedPreferences 持久化存储
- 拉黑/屏蔽后立即从列表中移除相关帖子
- 支持取消拉黑/屏蔽，数据实时更新

### 3. 关注服务 (FollowService)
**存储位置**: `lib/services/follow_service.dart`

**功能**:
- 关注/取消关注用户
- 查询关注状态
- 获取关注用户列表

**使用页面**:
- 首页 (HomeScreen) - 显示关注用户的帖子
- 帖子详情页 (PostDetailScreen) - 关注/取消关注操作
- 用户详情页 (UserDetailScreen) - 关注/取消关注操作

**数据一致性保证**:
- 所有操作通过 SharedPreferences 持久化存储
- 使用 `toggleFollow()` 方法确保状态切换的原子性
- 关注列表实时更新

### 4. 发布作品服务 (PostService)
**存储位置**: `lib/services/post_service.dart`

**功能**:
- 保存用户发布的作品
- 删除作品
- 获取用户作品列表

**使用页面**:
- 创建帖子页 (CreatePostScreen) - 保存新作品
- 个人资料页 (ProfileScreen) - 显示和删除作品
- 帖子详情页 (PostDetailScreen) - 删除作品

**数据一致性保证**:
- 所有操作通过 SharedPreferences 持久化存储
- 发布作品后通过回调机制立即同步到个人资料页
- 删除作品后立即从列表中移除

## 数据同步机制

### 1. 点赞状态同步
```
用户在帖子详情页点赞
  ↓
LikesFavoritesService.toggleLike()
  ↓
SharedPreferences 更新
  ↓
返回时通过回调通知列表页
  ↓
列表页刷新该帖子的点赞状态
```

### 2. 拉黑/屏蔽同步
```
用户在帖子详情页拉黑用户
  ↓
BlockMuteService.blockUser()
  ↓
SharedPreferences 更新
  ↓
返回时通过回调通知列表页
  ↓
列表页移除该用户的所有帖子
```

### 3. 发布作品同步
```
用户发布新作品
  ↓
PostService.addPost()
  ↓
SharedPreferences 更新
  ↓
通过主屏幕回调通知个人资料页
  ↓
个人资料页立即刷新显示新作品
```

## 数据存储键值

- `liked_post_ids`: 点赞的帖子ID列表
- `favorited_post_ids`: 收藏的帖子ID列表
- `blocked_users`: 拉黑的用户列表
- `muted_users`: 屏蔽的用户列表
- `followed_user_ids`: 关注的用户ID列表
- `my_posts`: 用户发布的作品列表

## 数据一致性保证

1. **单一数据源**: 所有数据都存储在 SharedPreferences 中，确保数据的唯一性
2. **服务层封装**: 所有数据操作都通过服务层进行，避免直接操作存储
3. **原子操作**: 使用 async/await 确保数据操作的原子性
4. **实时同步**: 通过回调机制确保UI实时反映数据变化
5. **状态管理**: 使用 setState 确保UI与数据状态同步

## 测试场景

### 场景1: 点赞同步
1. 在首页点赞一个帖子
2. 进入该帖子详情页，应该显示已点赞状态
3. 在详情页取消点赞
4. 返回首页，该帖子应该显示未点赞状态
5. 切换到个人资料页的点赞列表，该帖子应该不在列表中

### 场景2: 拉黑同步
1. 在首页进入某个帖子详情页
2. 拉黑该用户
3. 返回首页，该用户的所有帖子应该从列表中消失
4. 切换到探索页，该用户的帖子也应该不显示
5. 在设置中查看拉黑列表，该用户应该在列表中

### 场景3: 发布作品同步
1. 在首页点击相机图标发布新作品
2. 发布成功后，立即切换到个人资料页
3. 新作品应该立即显示在"我的作品"列表中
4. 无需刷新或切换标签

## 注意事项

1. SharedPreferences 是异步操作，所有读写都使用 async/await
2. 数据更新后需要调用 setState 来更新UI
3. 页面间通过回调机制同步数据，避免轮询
4. 所有服务方法都是静态方法，确保全局唯一性
5. 数据存储使用 JSON 序列化，确保数据结构的一致性
