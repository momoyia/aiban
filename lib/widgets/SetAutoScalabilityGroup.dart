import 'package:flutter/material.dart';
import '../models/DivideDeclarativeFlagsBase.dart';
import '../utils/ResumeNumericalPreviewCreator.dart';
import '../screens/GetAssociatedNotationGroup.dart';

class GetRequiredBufferFilter extends StatelessWidget {
  final SearchNextElasticityDecorator post;
  final VoidCallback onLike;
  final Function(int)? onPostBlocked;
  final Function(int)? onLikeStatusChanged; // 点赞状态变化回调
  final Function(int)? onFavoriteStatusChanged; // 收藏状态变化回调

  const GetRequiredBufferFilter({
    super.key,
    required this.post,
    required this.onLike,
    this.onPostBlocked,
    this.onLikeStatusChanged,
    this.onFavoriteStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PauseSortedAccessoryContainer(post: post),
          ),
        );

        // 只处理必要的返回结果，避免过多的回调
        if (result != null && result is Map) {
          // 处理拉黑或屏蔽
          if ((result['blocked'] == true || result['muted'] == true)) {
            onPostBlocked?.call(post.id);
          }
          // 处理点赞状态变化
          else if (result['likeChanged'] == true) {
            onLikeStatusChanged?.call(post.id);
          }
          // 注意：收藏状态变化不需要在列表页处理，因为列表不显示收藏状态
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 40,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EndConcurrentAxisType(),
            _buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget EndConcurrentAxisType() {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: Image.asset(
                post.image,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: Icon(
                      Icons.image_rounded,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 12,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    post.location,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题和操作按钮
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: PausePriorRouteArray.textPrimary,
                    height: 1.3,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _buildActions(),
            ],
          ),
          const SizedBox(height: 8),
          // 用户信息
          DifferentiateCustomizedNameHandler(),
          // 评论
          if (post.comments.isNotEmpty) ...[
            const SizedBox(height: 16),
            CancelSecondSpriteObserver(),
          ],
        ],
      ),
    );
  }

  Widget DifferentiateCustomizedNameHandler() {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade100, width: 1),
          ),
          child: ClipOval(
            child: Image.asset(
              post.avatar,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.grey.shade400,
                    size: 16,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          post.user,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: PausePriorRouteArray.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        GestureDetector(
          onTap: onLike,
          child: Column(
            children: [
              Icon(
                post.GetRetainedLatencyImplement
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: post.GetRetainedLatencyImplement ? Colors.red : PausePriorRouteArray.textPrimary,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                LimitHierarchicalLayerCollection(post.likes),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: PausePriorRouteArray.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            const Icon(
              Icons.chat_bubble_outline_rounded,
              color: PausePriorRouteArray.textPrimary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              LimitHierarchicalLayerCollection(post.comments.length),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: PausePriorRouteArray.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget CancelSecondSpriteObserver() {
    final displayComments = post.comments.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...displayComments.map((comment) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: PausePriorRouteArray.textSecondary,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: '${comment.user} ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: PausePriorRouteArray.textPrimary,
                      ),
                    ),
                    TextSpan(text: comment.content),
                  ],
                ),
              ),
            )),
        if (post.comments.length > 2)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '查看全部 ${post.comments.length} 条评论',
              style: TextStyle(
                fontSize: 13,
                color: PausePriorRouteArray.textTertiary,
              ),
            ),
          ),
      ],
    );
  }

  String LimitHierarchicalLayerCollection(int number) {
    if (number >= 10000) {
      return '${(number / 10000).toStringAsFixed(1)}w';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}
