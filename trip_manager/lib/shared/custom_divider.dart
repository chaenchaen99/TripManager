import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;

  const CustomDivider({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: color,
    );
  }
}
