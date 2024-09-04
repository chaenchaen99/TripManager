import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/auth/signup/providers/second_step_signup.dart';

class CustomEmailTextFormField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hintText;
  final void Function(String)? onChanged;
  final String? verifiBtnText;
  final FocusNode? focusNode;
  final void Function()? verifiBtnClicked;
  final bool isButtonEnabled;

  const CustomEmailTextFormField({
    super.key,
    required this.controller,
    this.title,
    this.hintText,
    this.onChanged,
    this.verifiBtnText,
    this.focusNode,
    this.verifiBtnClicked,
    required this.isButtonEnabled,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState
    extends ConsumerState<CustomEmailTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: _isFocused
                ? Colors.black
                : AppColors.darkColor_3, // Change color when focused
          ),
        ),
        Stack(children: [
          TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            maxLines: 1,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              hintText: widget.hintText ?? '',
              fillColor: Colors.transparent,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
              errorText: ref.read(secondStepSignupProvider).emailErrorMsg,
              contentPadding: const EdgeInsets.only(right: 90),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: 84,
              height: 36,
              child: TextButton(
                  onPressed:
                      widget.isButtonEnabled ? widget.verifiBtnClicked : null,
                  style: TextButton.styleFrom(
                    backgroundColor: widget.isButtonEnabled
                        ? AppColors.darkColor_1
                        : AppColors.lightColor_4, // 배경 색상 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0), // 모서리 반경 설정
                    ),
                  ),
                  child: Text(
                    widget.verifiBtnText ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  )),
            ),
          ),
        ]),
      ],
    );
  }
}
