import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Home%20View/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      body: Container(
        height: screenHeight * 0.300,
        decoration: BoxDecoration(gradient: Utils.primaryGradient),
        child: Column(),
      ),

    );
  }
}
