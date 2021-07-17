import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/presentation/screens/landing_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF1C086),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
          primaryColor: const Color(0xFFF1C086),
          fontFamily: 'Circular',
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF4E9197),
          )),
      home: const LandingPage(),
    );
  }
}
