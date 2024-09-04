import 'package:flutter/material.dart';
import '../../../../theme.dart';
import '../../start/widgets/custom_button.dart';

class CustomBottomBtn extends StatelessWidget {
  const CustomBottomBtn({
    super.key,
    required this.isKeyboardVisible,
    this.isEnabled = false,
  });

  final bool isKeyboardVisible;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 8, left: 18, right: 18, bottom: isKeyboardVisible ? 8 : 48),
      color: Colors.white, // BottomSheet 색상 변경
      child: CustomButton(
        text: '다음',
        backgroundColor: AppColors.mainColor,
        fontColor: Colors.white,
        isEnabled: isEnabled,
        onPressed: () {},
      ),
    );
  }
}
