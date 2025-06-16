import 'package:az_task/core/common/widgets/custom_btn.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/common/widgets/theme_toggle_switch.dart';
import 'package:az_task/core/extensions/navigation_extenstion.dart';
import 'package:az_task/core/routes/app_routes.dart';
import 'package:az_task/features/authentication/ui/widgets/custom_animate_loading.dart';
import 'package:az_task/features/authentication/ui/widgets/custom_txt_field.dart';
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
                            ? CustomLoadingIndicator()
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
                      // ignore: use_build_context_synchronously
                      context.pushNamed(AppRoutes.dashboardScreen);
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
