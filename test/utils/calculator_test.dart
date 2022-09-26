import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi/utils/calculator.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  test(
      'Give height and weight When calculateBmi function then corect BMI returned',
      () {
    //Arrange
    const int height = 70, weight = 160;
    //Act
    double bmi = calculateBMI(height, weight);
    //Assert
    expect(bmi, 22.955102040816328);
  });

  test('Give url When calculateBmiAsync function then corect BMI returned',
      () async {
    //Arrange
    final _dioMock = DioMock();
    when(() => _dioMock.get('https://www.jsonkeeper.com/b/AKFA')).thenAnswer(
      (_) => Future.value(
        Response(
          requestOptions:
              RequestOptions(path: 'https://www.jsonkeeper.com/b/AKFA'),
          data: {
            "Sergio Ramos": [72, 165]
          },
        ),
      ),
    );
    //Act
    var _result = await calculateBMIAsync(_dioMock);
    //Assert
    expect(_result, 22.375578703703706);
  });
}
