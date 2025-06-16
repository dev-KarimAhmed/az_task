import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:az_task/core/common/widgets/spaces.dart';

class AuthenticationFormField extends StatefulWidget {
  const AuthenticationFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    required this.keyboardType,
    this.controller,
    this.helperText,
  });

  final String title;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? helperText;

  @override
  State<AuthenticationFormField> createState() => _AuthenticationFormFieldState();
}

class _AuthenticationFormFieldState extends State<AuthenticationFormField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
        verticalSpace(8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _isFocused ? AppColors.primary : AppColors.secondary,
              width: _isFocused ? 2 : 1,
            ),
          ),
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              hintText: widget.hintText,
              helperText: widget.helperText,
              border: InputBorder.none,
              suffixIcon: widget.suffixIcon ??
                  AnimatedOpacity(
                    opacity: _isTyping ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.edit, size: 20),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
