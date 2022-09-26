import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ibmi/utils/calculator.dart';

import 'pages/home_page.dart';

void main() async {
  await calculateBMIAsync(
    Dio(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'IBMI',
      home: HomePage(),
    );
  }
}
