import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/pages/bmi_page.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ibmi/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end app test', () {
    //Arrange
    var _weightIncrementButton = find.byKey(const Key('weight_plus'));

    var _ageIncrementButton = find.byKey(const Key('age_plus'));

    var _calculateBMIButton = find.byType(CupertinoButton);

    testWidgets(
      'Given app is ran When height, age data input and calculateBMI button pressed Then correct BMI returned',
      (tester) async {
        //Arrange
        app.main();
        //Act
        await tester.pumpWidget(
          const CupertinoApp(
            home: BmiPage(),
          ),
        );
        await tester.pump();
        await tester.tap(_weightIncrementButton);
        await tester.pump();
        await tester.tap(_ageIncrementButton);
        await tester.pump();
        await tester.tap(_calculateBMIButton);
        await tester.pump();

        final _resultText = find.text('Normal');
        //Assert
        expect(_resultText, findsOneWidget);
      },
    );
  });
}
