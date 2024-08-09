import 'package:flutter/material.dart';
import 'package:music_app/View/Splash%20View/splash_view.dart';
import 'package:music_app/View/Splash%20View/splash_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> SplashViewmodel())
    ],
    child: const MaterialApp(
      home: SplashView(),
    ),);
  }
}
