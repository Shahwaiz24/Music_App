import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/app_logo_widget.dart';
import 'package:music_app/Services/utils.dart';

class GetinView extends StatefulWidget {
  const GetinView({super.key});

  @override
  State<GetinView> createState() => _GetinViewState();
}

class _GetinViewState extends State<GetinView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.100),
        child: Center(
          child: Column(
            children: [
              AppLogoWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  imageWidth: 0,
                  imageHeight: 0.300),
              SizedBox(
                height: screenHeight * 0.030,
              ),
              Text(
                "Let's get you in",
                style: TextStyle(
                    color: Utils.white,
                    fontFamily: 'Century Gothic Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.035),
              )
            ],
          ),
        ),
      ),
    );
  }
}
