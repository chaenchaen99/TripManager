import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewRatingBar extends StatelessWidget {
  final double size;
  const ReviewRatingBar({
    super.key,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar.builder(
        initialRating: 3, // 기본 별점 설정 (1~5)
        minRating: 1, // 최소 별점
        direction: Axis.horizontal, // 가로 방향
        allowHalfRating: true, // 반 별점 허용 여부
        itemCount: 5, // 별 5개
        itemSize: size,
        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber, // 별 색상
        ),
        onRatingUpdate: (rating) {
          print(rating); // 별점 값 업데이트
        },
      ),
    );
  }
}
