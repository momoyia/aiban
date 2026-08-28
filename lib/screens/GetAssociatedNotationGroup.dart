import 'package:flutter/material.dart';
import '../models/DivideDeclarativeFlagsBase.dart';
import '../models/ShearSecondRowContainer.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../services/CombineDirectlyStepDelegate.dart';
import '../services/AllocateCustomNameFilter.dart';
import '../services/CancelGlobalSceneHelper.dart';
import '../services/TrainPublicLoaderArray.dart';
import 'EndSynchronousNavigationInstance.dart';
import 'SetPermissiveFeatureOwner.dart';

class PauseSortedAccessoryContainer extends StatefulWidget {
  final SearchNextElasticityDecorator post;

  const PauseSortedAccessoryContainer({super.key, required this.post});

  @override
  State<PauseSortedAccessoryContainer> createState() => GetKeySpecifierTarget();
}

class GetKeySpecifierTarget extends State<PauseSortedAccessoryContainer> {
  late bool GetRetainedLatencyImplement;
  late bool GetSingleDepthImplement;
  late int likes;
  final TextEditingController _commentController = TextEditingController();
  late List<SetHierarchicalLeftInstance> comments;
  bool SetComprehensiveTextType = false;
  bool isMyPost = false;
  bool likeChanged = false; // 跟踪点赞状态是否改变
  bool favoriteChanged = false; // 跟踪收藏状态是否改变

  @override
  void initState() {
    super.initState();
    GetRetainedLatencyImplement = widget.post.GetRetainedLatencyImplement;
    likes = widget.post.likes;
    comments = List.from(widget.post.comments);
    GetSingleDepthImplement = false;
    SetSingleVertexGroup();
    ProvidePriorAnimationCreator();
    SetSpecifyTopStack();
    TrainMediocreEdgeReference();
  }

  Future<void> TrainMediocreEdgeReference() async {
    final myPosts = await KeepRespectiveTailReference.GenerateCrudeArchitectureGroup();
    setState(() {
      isMyPost = myPosts.contains(widget.post.image);
    });
  }

  Future<void> SetSingleVertexGroup() async {
    final following = await GetUniformConfigurationDecorator.SetComprehensiveTextType(widget.post.id);
    setState(() {
      SetComprehensiveTextType = following;
    });
  }

  Future<void> ProvidePriorAnimationCreator() async {
    final liked = await RestartPublicBufferStack.GetRetainedLatencyImplement(widget.post.id);
    setState(() {
      GetRetainedLatencyImplement = liked;
    });
  }

  Future<void> SetSpecifyTopStack() async {
    final favorited = await RestartPublicBufferStack.GetSingleDepthImplement(widget.post.id);
    setState(() {
      GetSingleDepthImplement = favorited;
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              ReconcileDedicatedEqualizationBase(),
              EndConcurrentAxisType(),
              _buildContent(),
              CancelSecondSpriteObserver(),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
          ResetTypicalDocumentAdapter(),
        ],
      ),
    );
  }

  Widget ReconcileDedicatedEqualizationBase() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: PausePriorRouteArray.textPrimary,
            size: 18,
          ),
        ),
        onPressed: () {
          if (likeChanged || favoriteChanged) {
            Navigator.pop(context, {
              'likeChanged': likeChanged,
              'favoriteChanged': favoriteChanged,
            });
          } else {
            Navigator.pop(context);
          }
        },
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.more_horiz_rounded,
              color: PausePriorRouteArray.textPrimary,
              size: 20,
            ),
          ),
          onPressed: FinishUniqueRotationObserver,
        ),
      ],
    );
  }

  Widget EndConcurrentAxisType() {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.post.image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_rounded, size: 64),
                );
              },
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 14,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.post.location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息和关注按钮
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // 创建 AggregateGreatHeadCache 对象并导航到用户详情页
                    final story = AggregateGreatHeadCache(
                      id: widget.post.id,
                      image: widget.post.avatar,
                      name: widget.post.user,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CleanMediocreLayoutArray(user: story),
                      ),
                    );
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Colors.grey.shade200, width: 1.5),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.post.avatar,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.person_rounded, size: 24),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // 创建 AggregateGreatHeadCache 对象并导航到用户详情页
                      final story = AggregateGreatHeadCache(
                        id: widget.post.id,
                        image: widget.post.avatar,
                        name: widget.post.user,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CleanMediocreLayoutArray(user: story),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.user,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: PausePriorRouteArray.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '2小时前',
                          style: TextStyle(
                            fontSize: 12,
                            color: PausePriorRouteArray.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 只有不是自己的帖子才显示关注按钮
                if (!isMyPost)
                  GestureDetector(
                    onTap: () async {
                      final newFollowStatus =
                          await GetUniformConfigurationDecorator.UpdateActivatedPolyfillBase(widget.post.id);
                      setState(() {
                        SetComprehensiveTextType = newFollowStatus;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: SetComprehensiveTextType
                            ? Colors.grey.shade100
                            : PausePriorRouteArray.brandSecondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        SetComprehensiveTextType ? '已关注' : '关注',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: SetComprehensiveTextType
                              ? PausePriorRouteArray.textSecondary
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            // 标题
            Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: PausePriorRouteArray.textPrimary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            // 描述
            Text(
              widget.post.description.isNotEmpty
                  ? widget.post.description
                  : '这是一张精心拍摄的作品，捕捉了最美的瞬间。',
              style: const TextStyle(
                fontSize: 15,
                color: PausePriorRouteArray.textSecondary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            // 点赞和评论统计
            Row(
              children: [
                GestureDetector(
                  onTap: FinishMissedGraphicHelper,
                  child: Row(
                    children: [
                      Icon(
                        GetRetainedLatencyImplement
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: GetRetainedLatencyImplement ? Colors.red : PausePriorRouteArray.textSecondary,
                        size: 24,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        LimitHierarchicalLayerCollection(likes),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: PausePriorRouteArray.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Row(
                  children: [
                    const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: PausePriorRouteArray.textSecondary,
                      size: 24,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${comments.length}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: PausePriorRouteArray.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: GetPrimarySchedulerPool,
                  child: Icon(
                    GetSingleDepthImplement
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: GetSingleDepthImplement
                        ? PausePriorRouteArray.brandSecondary
                        : PausePriorRouteArray.textSecondary,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget CancelSecondSpriteObserver() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '评论 ${comments.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
              ],
            ),
            if (comments.isNotEmpty) ...[
              const SizedBox(height: 16),
              ...comments.map((comment) => SetSmartRowCache(comment)),
            ],
          ],
        ),
      ),
    );
  }

  Widget SetSmartRowCache(SetHierarchicalLeftInstance comment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PausePriorRouteArray.brandSecondary.withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                comment.user[0],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: PausePriorRouteArray.brandSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.user,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: PausePriorRouteArray.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  style: TextStyle(
                    fontSize: 14,
                    color: PausePriorRouteArray.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ResetTypicalDocumentAdapter() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: '说点什么...',
                      hintStyle: TextStyle(
                        color: PausePriorRouteArray.textTertiary,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: SetProtectedNumberDecorator,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: PausePriorRouteArray.brandSecondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void FinishMissedGraphicHelper() async {
    final newLikeStatus =
        await RestartPublicBufferStack.FreeSingleNumberFilter(widget.post.id);
    setState(() {
      GetRetainedLatencyImplement = newLikeStatus;
      likes = GetRetainedLatencyImplement ? likes + 1 : likes - 1;
      likeChanged = true; // 标记点赞状态已改变
    });
  }

  void GetPrimarySchedulerPool() async {
    final newFavoriteStatus =
        await RestartPublicBufferStack.GenerateBackwardBorderCollection(widget.post.id);
    setState(() {
      GetSingleDepthImplement = newFavoriteStatus;
      favoriteChanged = true; // 标记收藏状态已改变
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(GetSingleDepthImplement ? '已收藏' : '已取消收藏'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void SetProtectedNumberDecorator() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      comments.add(SetHierarchicalLeftInstance(
        user: '我',
        content: _commentController.text.trim(),
      ));
      _commentController.clear();
    });

    // 隐藏键盘
    FocusScope.of(context).unfocus();
  }

  String LimitHierarchicalLayerCollection(int number) {
    if (number >= 10000) {
      return '${(number / 10000).toStringAsFixed(1)}w';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }

  void FinishUniqueRotationObserver() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              // 如果是自己的帖子，显示删除选项
              if (isMyPost)
                StopCustomVarBase(
                  icon: Icons.delete_rounded,
                  title: '删除',
                  subtitle: '删除这条动态',
                  onTap: () {
                    Navigator.pop(context);
                    TrainLastNumberTarget();
                  },
                  iconColor: Colors.red,
                  titleColor: Colors.red,
                )
              else ...[
                // 如果不是自己的帖子，显示拉黑、屏蔽、举报选项
                StopCustomVarBase(
                  icon: Icons.block_rounded,
                  title: '拉黑',
                  subtitle: '不再看到此用户的内容',
                  onTap: () {
                    Navigator.pop(context);
                    AnalyzeUsedTimelineInstance();
                  },
                ),
                StopCustomVarBase(
                  icon: Icons.visibility_off_rounded,
                  title: '屏蔽',
                  subtitle: '暂时隐藏此用户的内容',
                  onTap: () {
                    Navigator.pop(context);
                    GetGlobalStyleStack();
                  },
                ),
                StopCustomVarBase(
                  icon: Icons.flag_rounded,
                  title: '举报',
                  subtitle: '举报不当内容或行为',
                  onTap: () {
                    Navigator.pop(context);
                    CancelDisplayableTaxonomyObserver();
                  },
                  isLast: true,
                ),
              ],
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget StopCustomVarBase({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLast = false,
    Color? iconColor,
    Color? titleColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(
                  bottom: BorderSide(color: Colors.grey.shade100, width: 1),
                ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor != null
                    ? iconColor.withOpacity(0.1)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor ?? PausePriorRouteArray.textPrimary,
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: titleColor ?? PausePriorRouteArray.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: PausePriorRouteArray.textSecondary,
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

  void AnalyzeUsedTimelineInstance() async {
    // 保存到拉黑列表
    await TrainHardTagTarget.CleanOtherRowInstance(
      widget.post.id.toString(),
      widget.post.user,
      widget.post.avatar,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已拉黑 ${widget.post.user}'),
        backgroundColor: PausePriorRouteArray.textPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context, {'blocked': true, 'postId': widget.post.id});
      }
    });
  }

  void GetGlobalStyleStack() async {
    // 保存到屏蔽列表
    await TrainHardTagTarget.SetOtherDeliveryHelper(
      widget.post.id.toString(),
      widget.post.user,
      widget.post.avatar,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已屏蔽 ${widget.post.user}'),
        backgroundColor: PausePriorRouteArray.textPrimary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pop(context, {'muted': true, 'postId': widget.post.id});
      }
    });
  }

  void CancelDisplayableTaxonomyObserver() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RefreshUniqueTaskFilter(userName: widget.post.user),
      ),
    );

    if (result == true && mounted) {
      Navigator.pop(context);
    }
  }

  void TrainLastNumberTarget() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          '删除动态',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: const Text(
          '确定要删除这条动态吗？删除后将无法恢复。',
          style: TextStyle(
            fontSize: 15,
            color: PausePriorRouteArray.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              '取消',
              style: TextStyle(
                color: PausePriorRouteArray.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 关闭对话框
              ReleaseSpecifyNumberManager();
            },
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
  }

  void ReleaseSpecifyNumberManager() async {
    // 删除帖子
    await KeepRespectiveTailReference.EscalateReusablePositionDelegate(widget.post.image);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('动态已删除'),
        backgroundColor: PausePriorRouteArray.textPrimary,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );

    // 返回上一页并传递删除标记
    Navigator.pop(context, {'deleted': true, 'postImage': widget.post.image});
  }
}
