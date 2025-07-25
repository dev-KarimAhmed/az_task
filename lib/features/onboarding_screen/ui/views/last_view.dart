import 'package:az_task/core/animation/custom_fade_animation.dart';
import 'package:az_task/core/common/widgets/custom_btn.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/extensions/navigation_extenstion.dart';
import 'package:az_task/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LastView extends StatelessWidget {
  const LastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,

        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              'Start Success Story , With Us!',
              style: TextTheme.of(
                context,
              ).titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            verticalSpace(40),
            CustomFadeInAnimation(
              child: CustomButton(
            child:  Text(
         "Get Started",
          style: TextTheme.of(context).bodyLarge?.copyWith(color: Colors.white),
        ),
                onPressed: () => context.pushNamed(AppRoutes.loginScreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
