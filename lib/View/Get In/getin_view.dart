import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/app_logo_widget.dart';
import 'package:music_app/Custom%20Widgets/button_container.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Login%20View/login_view.dart';
import 'package:music_app/View/Sign%20Up/signup_view.dart';

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
                height: screenHeight * 0.010,
              ),
              Text(
                "Let's get you in",
                style: TextStyle(
                    color: Utils.white,
                    fontFamily: 'Century Gothic Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.040),
              ),
              SizedBox(
                height: screenHeight * 0.030,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.070, left: screenWidth * 0.070),
                child: ButtonContainer(
                  isSimple: true,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage("assets/image/google.png"),
                        height: screenHeight * 0.035,
                      ),
                      SizedBox(
                        width: screenWidth * 0.030,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                            color: Utils.white,
                            fontFamily: "Century Gothic Bold",
                            fontSize: screenHeight * 0.018),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.070,
                    left: screenWidth * 0.070,
                    top: screenHeight * 0.030),
                child: ButtonContainer(
                  isSimple: true,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage("assets/image/facebook.png"),
                        height: screenHeight * 0.035,
                      ),
                      SizedBox(
                        width: screenWidth * 0.030,
                      ),
                      Text(
                        "Continue with Facebook",
                        style: TextStyle(
                            color: Utils.white,
                            fontFamily: "Century Gothic Bold",
                            fontSize: screenHeight * 0.018),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.020,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.060, right: screenWidth * 0.060),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: screenHeight * 0.002,
                        decoration: BoxDecoration(color: Utils.white),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.020,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          color: Utils.white,
                          fontFamily: "Mulish Bold",
                          fontSize: screenHeight * 0.020),
                    ),
                    SizedBox(width: screenWidth * 0.020),
                    Expanded(
                      child: Container(
                        height: screenHeight * 0.002,
                        decoration: BoxDecoration(color: Utils.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.030,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.050),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: ButtonContainer(
                      isSimple: false,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      child: Center(
                        child: Text(
                          "Login with Password",
                          style: TextStyle(
                              color: Utils.white,
                              fontFamily: "Mulish Bold",
                              fontSize: screenHeight * 0.020),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.030,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    print("Navigating to SignUp");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupView()));
                  },
                  child: Text.rich(
                    TextSpan(
                        text: "Don’t have an account?",
                        style: TextStyle(
                            color: Utils.white,
                            fontFamily: "Mulish Regular",
                            fontSize: screenHeight * 0.020),
                        children: <TextSpan>[
                          TextSpan(
                              text: " SignUp",
                              style: TextStyle(
                                  color: Utils.blueText,
                                  fontFamily: "Mulish Regular",
                                  fontSize: screenHeight * 0.020))
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
