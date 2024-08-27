import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/theme.dart';

class AiTimelineItem extends StatelessWidget {
  final AiResponse courseItem;
  const AiTimelineItem({
    super.key,
    required this.courseItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseItem.title,
                style: const TextStyle(
                  color: AppColors.darkColor_1, // Blue text color
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                courseItem.subTitle,
                style: const TextStyle(
                  color: AppColors.darkColor_3,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
