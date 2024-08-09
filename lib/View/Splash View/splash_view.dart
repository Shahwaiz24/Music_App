import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/View/Splash%20View/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      print("Timer Completed");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final splash_model = Provider.of<SplashViewmodel>(context);

    return Scaffold();
  }
}
