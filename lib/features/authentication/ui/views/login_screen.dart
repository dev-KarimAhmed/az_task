import 'package:az_task/core/common/widgets/custom_btn.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/common/widgets/theme_toggle_switch.dart';
import 'package:az_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ThemeToggleSwitch(),
                  ),
                  verticalSpace(MediaQuery.of(context).size.height * 0.2),
                  Text(
                    'Login to your account',
                    style: TextTheme.of(
                      context,
                    ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(16),
                  AuthenticationFormField(
                    title: 'Email',
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    controller: TextEditingController(),
                  ),
                  verticalSpace(16),
                  AuthenticationFormField(
                    title: 'Password',
                    hintText: 'Enter your password',
                    obscureText: isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon:
                          isObscure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  verticalSpace(16),
                  CustomButton(
                    height: 45.h,
                    width: double.infinity,
                    child:
                        isLoading
                            ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                horizontalSpace(8),
                                Text(
                                  "Please Wait...",
                                  style: TextTheme.of(
                                    context,
                                  ).bodyLarge?.copyWith(color: Colors.white),
                                ),
                              ],
                            )
                            : Text(
                              "Login",
                              style: TextTheme.of(
                                context,
                              ).bodyLarge?.copyWith(color: Colors.white),
                            ),
                    onPressed: () async {
                      if (isLoading) return;
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthenticationFormField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        verticalSpace(8),
        TextFormField(
          
          cursorOpacityAnimates: true,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          cursorColor: AppColors.primary,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            helperText: helperText,
            hintText: hintText,

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
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

