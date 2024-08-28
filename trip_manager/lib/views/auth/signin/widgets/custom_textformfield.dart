import 'package:flutter/material.dart';
import 'package:trip_manager/theme.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hintText;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.title,
    this.hintText,
    this.onChanged,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.dispose();
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
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode, // Attach the focus node here
          decoration: InputDecoration(
            hintText: widget.hintText ?? '',
            fillColor: Colors.transparent,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
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
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
