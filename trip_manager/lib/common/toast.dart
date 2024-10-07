import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//사용  - toast(context,'촤대 2개까지 선택 가능합니다');

void toast(context, text) {
  final fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    width: MediaQuery.of(context).size.width - 36,
    height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      color: const Color(0xFF515151),
    ),
    child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text, style: const TextStyle(color: Colors.white))),
  );

  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
      positionedToastBuilder: (context, child) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 60,
              child: child,
            ),
          ],
        );
      });
}
