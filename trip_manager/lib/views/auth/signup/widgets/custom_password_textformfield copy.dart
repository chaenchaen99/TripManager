import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/auth/signup/providers/second_step_signup.dart';
import 'check_validation_text.dart';

class CustomPasswordTextFormField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hintText;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final void Function()? visibilityBtnClicked;
  final List<ValidationItem> validationItems; // 추가된 부분

  const CustomPasswordTextFormField({
    super.key,
    required this.controller,
    this.title,
    this.hintText,
    this.onChanged,
    this.focusNode,
    this.visibilityBtnClicked,
    required this.validationItems, // 추가된 부분
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class ValidationItem {
  final String text;
  final bool isValid;

  ValidationItem(this.text, this.isValid);
}

class _CustomTextFormFieldState
    extends ConsumerState<CustomPasswordTextFormField> {
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
            color: _isFocused ? Colors.black : AppColors.darkColor_3,
          ),
        ),
        Stack(children: [
          Column(
            children: [
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
              const SizedBox(height: 8),
              // 유효성 검사 항목 표시
              if (widget.validationItems.isNotEmpty)
                Row(
                  children: [
                    Row(
                      children: [
                        CheckValidationIcon(
                            isValid: widget.validationItems[0].isValid),
                        CheckValidationText(
                          text: widget.validationItems[0].text,
                          isValid: widget.validationItems[0].isValid,
                        ),
                      ],
                    ),
                    if (widget.validationItems.length > 1)
                      const SizedBox(width: 16),
                    if (widget.validationItems.length > 1)
                      Row(
                        children: [
                          CheckValidationIcon(
                              isValid: widget.validationItems[1].isValid),
                          CheckValidationText(
                            text: widget.validationItems[1].text,
                            isValid: widget.validationItems[1].isValid,
                          ),
                        ],
                      ),
                  ],
                ),
            ],
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: widget.visibilityBtnClicked,
              icon: Image.asset(
                'assets/icons/visibility.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
