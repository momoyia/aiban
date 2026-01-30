# 交互失效问题修复

## 问题描述
用户在点赞、收藏几个帖子后，页面的所有点击交互都会失效。这个问题在首页、探索页面和分类详情页都会出现。

## 根本原因
1. **过度使用 didChangeDependencies**: `home_screen.dart` 和 `explore_screen.dart` 中的 `didChangeDependencies` 方法在每次页面可见时都会调用 `_loadData()`，导致过多的状态更新和重建
2. **废弃的 PopScope API**: `post_detail_screen.dart` 使用了已废弃的 `onPopInvoked`，可能导致导航问题
3. **异步操作中的 mounted 检查不一致**: 某些异步操作使用 `if (mounted)` 包裹整个代码块，而不是在使用 context 之前立即检查

## 修复方案

### 1. 移除 didChangeDependencies 中的自动刷新
**文件**: `lib/screens/home_screen.dart`, `lib/screens/explore_screen.dart`

**修改前**:
```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  // 当页面重新可见时刷新数据
  _loadData();
}
```

**修改后**:
```dart
// 完全移除 didChangeDependencies 方法
```

**原因**: `didChangeDependencies` 在页面切换时会被频繁调用，导致不必要的状态更新和重建，最终导致交互失效。

### 2. 移除 PopScope 包装
**文件**: `lib/screens/post_detail_screen.dart`

**修改前**:
```dart
return PopScope(
  onPopInvoked: (didPop) {
    if (didPop && (likeChanged || favoriteChanged)) {
      Navigator.of(context).pop({...});
    }
  },
  child: Scaffold(...),
);
```

**修改后**:
```dart
return Scaffold(...);
```

**原因**: `onPopInvoked` 已废弃，且这种双重导航逻辑可能导致问题。返回值已经在 AppBar 的返回按钮中正确处理。

### 3. 统一 mounted 检查模式
**文件**: `lib/screens/home_screen.dart`, `lib/screens/category_detail_screen.dart`, `lib/screens/post_detail_screen.dart`

**修改前**:
```dart
if (mounted) {
  setState(() {...});
  ScaffoldMessenger.of(context).showSnackBar(...);
}
```

**修改后**:
```dart
if (!mounted) return;

setState(() {...});
ScaffoldMessenger.of(context).showSnackBar(...);
```

**原因**: 早期返回模式更清晰，避免嵌套过深，且确保在使用 context 之前立即检查 mounted 状态。

## 测试场景

### 场景 1: 首页点赞和收藏
1. 打开应用，进入首页
2. 点赞多个帖子（至少 3-5 个）
3. 收藏多个帖子
4. 切换到探索页面
5. 验证所有按钮和交互仍然正常工作

### 场景 2: 分类详情页交互
1. 进入探索页面
2. 打开任意分类详情页
3. 点赞和收藏帖子
4. 返回探索页面
5. 验证所有交互正常

### 场景 3: 帖子详情页操作
1. 打开任意帖子详情页
2. 点赞、收藏、评论
3. 返回列表页
4. 验证列表页交互正常

### 场景 4: 拉黑和屏蔽
1. 打开帖子详情页
2. 拉黑或屏蔽用户
3. 等待 SnackBar 显示完成
4. 验证返回列表页后交互正常

## 预防措施

### 1. 避免在生命周期方法中过度刷新
- 不要在 `didChangeDependencies` 中调用 `setState`
- 只在必要时使用 `didUpdateWidget`
- 优先使用显式的刷新方法（如按钮点击、下拉刷新）

### 2. 简化回调链
- 避免多层嵌套的回调
- 使用简单的返回值而不是复杂的回调函数
- 只在真正需要时传递状态变化

### 3. 正确使用 mounted 检查
- 在所有异步操作后使用 `if (!mounted) return;`
- 在使用 context 之前立即检查
- 避免在 mounted 检查内嵌套大量代码

### 4. 使用最新的 Flutter API
- 避免使用已废弃的 API（如 `onPopInvoked`）
- 定期检查 Flutter 更新和迁移指南
- 使用 `flutter analyze` 检查警告

## 相关文件
- `lib/screens/main_screen.dart` - 主屏幕（已简化）
- `lib/screens/home_screen.dart` - 首页（移除 didChangeDependencies）
- `lib/screens/explore_screen.dart` - 探索页（移除 didChangeDependencies）
- `lib/screens/profile_screen.dart` - 个人资料页（已优化）
- `lib/screens/category_detail_screen.dart` - 分类详情页（统一 mounted 检查）
- `lib/screens/post_detail_screen.dart` - 帖子详情页（移除 PopScope，统一 mounted 检查）
- `lib/widgets/post_card.dart` - 帖子卡片（简化回调逻辑）

## 数据一致性
所有点赞、收藏、拉黑、屏蔽操作都通过 SharedPreferences 作为单一数据源，确保数据在全应用范围内保持一致。详见 `DATA_CONSISTENCY.md`。
