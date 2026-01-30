import 'package:flutter/material.dart';
import '../models/story.dart';
import '../utils/app_colors.dart';
import '../screens/user_detail_screen.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final Function(int)? onUserBlocked;

  const StoryItem({
    super.key,
    required this.story,
    this.onUserBlocked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailScreen(user: story),
          ),
        );

        // 处理拉黑或屏蔽的返回结果
        if (result != null && result is Map) {
          if ((result['blocked'] == true || result['muted'] == true) &&
              onUserBlocked != null) {
            onUserBlocked!(story.id);
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.brandGradient,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    story.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.person_rounded,
                          color: Colors.grey.shade400,
                          size: 32,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              story.name,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${story.worksCount}作品',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
