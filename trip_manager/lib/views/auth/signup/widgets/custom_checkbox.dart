import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCheckbox extends ConsumerWidget {
  const CustomCheckbox({
    Key? key,
    required this.isChecked,
    required this.toggleCallback,
  }) : super(key: key);

  final bool isChecked;
  final VoidCallback toggleCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => toggleCallback(),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: isChecked ? Colors.blue : Colors.transparent,
          border: isChecked
              ? null
              : Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
          borderRadius: BorderRadius.circular(25), // 동그란 체크박스
        ),
        alignment: Alignment.center,
        child: isChecked
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
