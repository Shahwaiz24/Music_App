import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  "assets/image/logo.png",
                ),
                height: screenHeight * 0.250,
              ),
              Image(
                image: AssetImage(
                  "assets/image/musium.png",
                ),
                height: screenHeight * 0.080,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
