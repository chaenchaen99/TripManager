import 'package:flutter/material.dart';

class AIResponseHeader extends StatelessWidget {
  const AIResponseHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/ai_sender.png',
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          const Text(
            '답변',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
