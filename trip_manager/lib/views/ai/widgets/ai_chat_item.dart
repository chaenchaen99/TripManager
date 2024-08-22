import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/theme.dart';

class AiChatItem extends StatelessWidget {
  final AiResponse courseItem;
  const AiChatItem({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/aiDetail', extra: courseItem);
        },
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightColor_2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  courseItem.imageUrl, // Replace with your image path
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseItem.title,
                    style: const TextStyle(
                      color: AppColors.darkColor_3, // Blue text color
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    courseItem.subTitle,
                    style: const TextStyle(
                      color: AppColors.darkColor_1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
