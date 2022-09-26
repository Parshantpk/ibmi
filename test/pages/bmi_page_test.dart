import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/pages/bmi_page.dart';

void main() {
  testWidgets(
      'Given weightInfoCard When user click + button then weight incremented by 1',
      (tester) async {
    //Arrange
    await tester.pumpWidget(
      const CupertinoApp(
        home: BmiPage(),
      ),
    );
    var _weightIncrementButton = find.byKey(
      const Key('weight_plus'),
    );
    //Act
    await tester.tap(_weightIncrementButton);
    await tester.pump();
    //Assert
    var _text = find.text('161');
    expect(_text, findsOneWidget);
  });

  testWidgets(
      'Given weightInfoCard When user click - button then weight decremented by 1',
          (tester) async {
        //Arrange
        await tester.pumpWidget(
          const CupertinoApp(
            home: BmiPage(),
          ),
        );
        var _weightDecrementButton = find.byKey(
          const Key('weight_minus'),
        );
        //Act
        await tester.tap(_weightDecrementButton);
        await tester.pump();
        //Assert
        var _text = find.text('159');
        expect(_text, findsOneWidget);
      });
}
