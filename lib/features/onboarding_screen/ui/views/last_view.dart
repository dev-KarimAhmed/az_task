import 'package:az_task/core/animation/custom_fade_animation.dart';
import 'package:az_task/core/common/widgets/custom_btn.dart';
import 'package:az_task/core/common/widgets/spaces.dart';
import 'package:az_task/core/extensions/navigation_extenstion.dart';
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
          children: [
            const Text('Start Success Story , With Us!'),
            verticalSpace(40),
            CustomFadeInAnimation(
              child: CustomButton(),
            ),
          ],
        ),
      ),
    );
  }
}
