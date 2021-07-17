import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';
import 'screens.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      // appBar: AppBar(
      //   brightness: Brightness.dark,
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: [const DrawerScreen(), const HomeScreen()],
      ),
    );
  }
}
