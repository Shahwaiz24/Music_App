import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/On%20Boarding/onboarding_viewmodel.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final model = Provider.of<OnboardingViewmodel>(context);
    return Scaffold(
      backgroundColor: Utils.bluePrimary.withOpacity(0.9),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.060),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.060, left: screenWidth * 0.050),
                    child: Row(
                      children: [
                        Container(
                          height: screenHeight * 0.130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Utils.roundBlue,
                              width: 10, // adjust the width to your liking
                              style: BorderStyle.solid,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: -10,
                                blurRadius: 10,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: -5,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
