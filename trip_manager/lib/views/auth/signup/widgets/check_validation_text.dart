import 'package:flutter/material.dart';

import '../../../../theme.dart';

class CheckValidationIcon extends StatelessWidget {
  const CheckValidationIcon({
    super.key,
    required this.isValid,
  });

  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      color: isValid ? AppColors.mainColor : Colors.grey,
      size: 16.0,
    );
  }
}

class CheckValidationText extends StatelessWidget {
  const CheckValidationText({
    super.key,
    required this.text,
    required this.isValid,
  });

  final String text;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: isValid ? AppColors.mainColor : Colors.grey,
      ),
    );
  }
}
