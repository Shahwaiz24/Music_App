import 'package:flutter/material.dart';
import 'package:music_app/Services/local_Storage.dart';
import 'package:music_app/View/Login%20View/login_viewmodel.dart';
import 'package:music_app/View/On%20Boarding/onboarding_viewmodel.dart';
import 'package:music_app/View/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:music_app/View/Splash%20View/splash_view.dart';
import 'package:music_app/View/Splash%20View/splash_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewmodel()),
        ChangeNotifierProvider(create: (_) => OnboardingViewmodel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
