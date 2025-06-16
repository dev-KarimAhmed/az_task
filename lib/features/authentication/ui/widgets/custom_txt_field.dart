import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

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
  State<AuthenticationFormField> createState() =>
      _AuthenticationFormFieldState();
}

class _AuthenticationFormFieldState extends State<AuthenticationFormField>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late TextEditingController _internalController;
  late AnimationController _typingAnimationController;
  late Animation<int> _dotAnimation;
  bool _isTyping = false; // To control when the animation should be active

  @override
  void initState() {
    super.initState();
    // Use the provided controller or create an internal one if not provided
    _internalController = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();

    // Initialize animation controller for the typing dots
    _typingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ), // Faster animation for typing
    );
    _dotAnimation = IntTween(
      begin: 0,
      end: 3,
    ).animate(_typingAnimationController);

    // Listen to focus changes
    _focusNode.addListener(_handleFocusChange);
    // Listen to text changes to determine if user is typing
    _internalController.addListener(_handleTextChange);
  }

  void _handleFocusChange() {
    setState(() {
      // If focused and text is not empty, or if text is empty but field is focused,
      // consider it 'typing' for the animation.
      _isTyping = _focusNode.hasFocus && _internalController.text.isNotEmpty;
      if (_isTyping) {
        _typingAnimationController.repeat();
      } else {
        _typingAnimationController.stop();
        _typingAnimationController.value = 0; // Reset animation when not typing
      }
    });
  }

  void _handleTextChange() {
    setState(() {
      _isTyping = _focusNode.hasFocus && _internalController.text.isNotEmpty;
      if (_isTyping && !_typingAnimationController.isAnimating) {
        _typingAnimationController.repeat();
      } else if (!_isTyping && _typingAnimationController.isAnimating) {
        _typingAnimationController.stop();
        _typingAnimationController.value = 0;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _internalController.removeListener(_handleTextChange);
    _focusNode.dispose();
    if (widget.controller == null) {
      // Only dispose if we created it internally
      _internalController.dispose();
    }
    _typingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        verticalSpace(8),
        TextFormField(
          cursorOpacityAnimates: true,
          magnifierConfiguration: const TextMagnifierConfiguration(
            shouldDisplayHandlesInMagnifier: true,
          ),
          controller: _internalController,
          focusNode: _focusNode, // Assign the focus node
          obscureText: widget.obscureText,
          validator: widget.validator,
          cursorColor: AppColors.primary,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            helperText: widget.helperText,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.secondary, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.secondary, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.secondary, width: 1.8),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            // Conditionally show typing animation or the provided suffixIcon
            suffixIcon:
                widget.suffixIcon ??
                (_isTyping
                    ? AnimatedBuilder(
                      animation: _dotAnimation,
                      builder: (context, child) {
                        String dots = '.' * _dotAnimation.value;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            dots,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    )
                    : null),
          ),
        ),
      ],
    );
  }
}
