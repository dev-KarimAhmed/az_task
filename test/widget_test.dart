import 'package:az_task/core/common/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Import the file where CustomButton is defined, e.g.:

void main() {
  testWidgets('CustomButton renders and responds to tap', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => MaterialApp(
          home: Scaffold(
            body: CustomButton(
              onPressed: () {
                tapped = true;
              },
              child: const Text('Click Me'),
            ),
          ),
        ),
      ),
    );

    // Verify button is in the tree
    expect(find.byType(CustomButton), findsOneWidget);

    // Verify the child text is present
    expect(find.text('Click Me'), findsOneWidget);

    // Tap the button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the tap worked
    expect(tapped, isTrue);
  });
}