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
      backgroundColor: Utils.bluePrimary,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.060),
                child: Image(
                  image: AssetImage("assets/image/img_girl.png"),
                  height: screenHeight * 0.450,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.300,
              decoration: BoxDecoration(
                  color: Utils.black.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.120),
                      topRight: Radius.circular(screenWidth * 0.120))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text.rich(
                      style: TextStyle(
                          fontSize: screenHeight * 0.027,
                          fontFamily: "Century Gothic",
                          fontWeight: FontWeight.bold),
                      TextSpan(
                        text: '       From ', // White text
                        style: TextStyle(
                          color: Utils.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Latest', // Blue text
                            style: TextStyle(color: Utils.bluePrimary),
                          ),
                          TextSpan(
                            text: ' to the \n', // White text
                            style: TextStyle(color: Utils.white),
                          ),
                          TextSpan(
                            text: '     Greatest', // Blue text
                            style: TextStyle(color: Utils.bluePrimary),
                          ),
                          TextSpan(
                            text:
                                ' hits, Play your\n favourite tracks on ', // White text
                            style: TextStyle(color: Utils.white),
                          ),
                          TextSpan(
                            text: 'musium \n', // Blue text
                            style: TextStyle(color: Utils.bluePrimary),
                          ),
                          TextSpan(
                              text: '                  Now!',
                              style: TextStyle(color: Utils.white))
                        ],
                      ),
                    ),
                  ),
              SizedBox()
              
              
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
