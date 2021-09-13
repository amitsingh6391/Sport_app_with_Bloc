import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sports/ui/homescreen.dart';

import 'package:lottie/lottie.dart';
import 'package:sports/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // context.read(sportsDataProvider).checkConnectivity();
    // context.read(sportsDataProvider).getSportsData();
    startTime();

    // context.read<CounterCubit>().increment(),

    // context.read<SportservicesEvent>().add
  }

  Future<void> startTime() async {
    const _duration = Duration(seconds: 4);
    Timer(_duration, navigationPage);
  }

  navigationPage() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(splashLogo),
      ),
    );
  }
}
