import 'package:flutter/material.dart';

class SSOButton extends StatelessWidget {
  final Widget? icon; // 아이콘을 위한 매개변수
  final String text; // 버튼의 텍스트
  final Color backgroundColor; // 버튼의 배경색
  final Color? outlineColor; // 버튼의 outline색
  final Color fontColor; // 텍스트 색
  final VoidCallback onPressed; // 버튼 클릭 시 동작

  const SSOButton({
    super.key,
    this.icon,
    this.outlineColor,
    required this.text,
    required this.backgroundColor,
    required this.fontColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 320,
        height: 52,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(
              color: outlineColor ?? Colors.transparent, // 테두리 색상, 기본값은 투명
              width: 1, // 테두리 두께
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12), // 버튼의 패딩

            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center, // 자식 위젯들을 중앙 정렬
            children: [
              if (icon != null) ...[
                Positioned(
                  left: 4, // 아이콘을 왼쪽에 배치
                  child: icon!,
                ),
              ],
              Align(
                alignment: Alignment.center, // 텍스트를 중앙에 배치
                child: Text(
                  text,
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
