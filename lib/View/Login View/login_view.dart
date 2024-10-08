import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/app_logo_widget.dart';
import 'package:music_app/Custom%20Widgets/button_container.dart';
import 'package:music_app/Custom%20Widgets/text_field.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Login%20View/login_viewmodel.dart';
import 'package:music_app/View/Sign%20Up%20View/signup_view.dart';
import 'package:music_app/http_model/http_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginViewModel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.040, top: screenHeight * 0.100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      loginEmailController.clear();
                      loginPasswordController.clear();
                      model.failureResponse = false;
                      model.successResponse = false;
                      model.isLoginLoading = false;

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
                  isSearch: false,
                  hint: "Email",
                  fontFamily: "Century Gothic",
                  isSufix: false,
                  suffixIcon: Text(""),
                  PrefixIcon: Icon(
                    Icons.email_outlined,
                    color: Utils.white.withOpacity(0.3),
                  ),
                  fontsize: 0.022,
                  screenWidth: screenWidth,
                  radius: screenWidth * 0.030,
                  screenHeight: screenHeight,
                  editingController: loginEmailController,
                  isObsecure: false),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.050,
                  right: screenWidth * 0.050,
                  top: screenWidth * 0.030),
              child: Consumer<LoginViewModel>(builder: (context, value, child) {
                print("Hisdsdsd");

                return TextFieldWigdet(
                    isSearch: false,
                    hint: "Password",
                    isSufix: true,
                    suffixIcon: InkWell(
                      onTap: () {
                        value.enableHiding();
                      },
                      child: value.isHide == true
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: Utils.white.withOpacity(0.5),
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: Utils.white.withOpacity(0.5),
                            ),
                    ),
                    fontFamily: "Century Gothic",
                    fontsize: 0.022,
                    screenWidth: screenWidth,
                    radius: screenWidth * 0.030,
                    PrefixIcon: Icon(
                      Icons.lock_outline,
                      color: Utils.white.withOpacity(0.3),
                    ),
                    screenHeight: screenHeight,
                    editingController: loginPasswordController,
                    isObsecure: value.isHide);
              }),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<LoginViewModel>(builder: (context, value, child) {
              return value.failureResponse == true
                  ? Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.050),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            color: Colors.red,
                            size: screenHeight * 0.030,
                          ),
                          SizedBox(
                            width: screenWidth * 0.020,
                          ),
                          Text(value.errorMsg!,
                              style: TextStyle(
                                color: Utils.white,
                                fontFamily: "Mulish Regular",
                                fontSize: screenHeight * 0.021,
                              ))
                        ],
                      ),
                    )
                  : value.successResponse == true
                      ? Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.050),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_box_outlined,
                                color: Color.fromARGB(255, 73, 218, 78),
                                size: screenHeight * 0.030,
                              ),
                              SizedBox(
                                width: screenWidth * 0.020,
                              ),
                              Text(value.successMsg,
                                  style: TextStyle(
                                    color: Utils.white,
                                    fontFamily: "Mulish Regular",
                                    fontSize: screenHeight * 0.021,
                                  ))
                            ],
                          ),
                        )
                      : Text('');
            }),
            Consumer<LoginViewModel>(builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.050,
                    right: screenWidth * 0.050,
                    top: value.failureResponse == true
                        ? screenHeight * 0.020
                        : value.successResponse == true
                            ? screenHeight * 0.020
                            : 0),
                child: InkWell(
                  onTap: () {
                    value.login(
                        context: context,
                        body: UserloginModel(
                            email: loginEmailController.text,
                            password: loginPasswordController.text));
                  },
                  child: ButtonContainer(
                    isSimple: false,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    child: value.isLoginLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Utils.white,
                            ),
                          )
                        : Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Utils.white,
                                  fontFamily: "Mulish Bold",
                                  fontSize: screenHeight * 0.020),
                            ),
                          ),
                  ),
                ),
              );
            }),
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
                    'or continue with',
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
              height: screenHeight * 0.010,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.120),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Utils.white.withOpacity(0.5), width: 1)),
                      height: screenHeight * 0.100,
                      width: screenWidth * 0.150,
                      child: Image(
                        image: AssetImage(
                          "assets/image/facebook.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Utils.white.withOpacity(0.5), width: 1)),
                    height: screenHeight * 0.100,
                    width: screenWidth * 0.150,
                    child: Image(
                      image: AssetImage("assets/image/google.png"),
                      fit: BoxFit.none,
                      height: screenHeight * 0.010,
                      width: screenWidth * 0.010,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  print("Navigating to SignUp");
                  loginEmailController.clear();
                  loginPasswordController.clear();
                  model.failureResponse = false;
                  model.successResponse = false;
                  model.isLoginLoading = false;
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
    );
  }
}
