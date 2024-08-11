import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/app_logo_widget.dart';
import 'package:music_app/Custom%20Widgets/text_field.dart';
import 'package:music_app/Services/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

TextEditingController loginEmailController = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.040),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Utils.white,
                      size: screenHeight * 0.040,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            AppLogoWidget(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                imageWidth: 0,
                imageHeight: 0.270),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Text(
              "Login to your account",
              style: TextStyle(
                  color: Utils.white,
                  fontFamily: "Century Gothic Bold",
                  fontSize: screenHeight * 0.033),
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.050),
              child: TextFieldWigdet(
                  hint: "Email",
                  fontFamily: "Century Gothic",
                  fontsize: 0.022,
                  screenWidth: screenWidth,
                  radius: screenWidth * 0.030,
                  screenHeight: screenHeight,
                  editingController: loginEmailController,
                  isObsecure: false),
            )
          ],
        ),
      ),
    );
  }
}
