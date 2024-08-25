import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/app_logo_widget.dart';
import 'package:music_app/Custom%20Widgets/button_container.dart';
import 'package:music_app/Custom%20Widgets/text_field.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Login%20View/login_view.dart';
import 'package:music_app/View/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:music_app/http_model/http_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

TextEditingController signUpEmailController = TextEditingController();
TextEditingController signUpNameController = TextEditingController();

TextEditingController signUpPasswordController = TextEditingController();

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final model = Provider.of<SignUpViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      body: SingleChildScrollView(
        child: Padding(
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
                        signUpEmailController.clear();
                        signUpNameController.clear();
                        model.failureResponse = false;
                        signUpPasswordController.clear();
                        model.successResponse = false;
                        model.isSignUpLoading = false;
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
                height: screenHeight * 0.010,
              ),
              AppLogoWidget(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  imageWidth: 0,
                  imageHeight: 0.240),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                "Create your account",
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
                    hint: "Full Name",
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
                    editingController: signUpNameController,
                    isObsecure: false),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.050,
                    right: screenWidth * 0.050,
                    top: screenWidth * 0.030),
                child:
                    Consumer<SignUpViewModel>(builder: (context, value, child) {
                  return TextFieldWigdet(
                       isSearch: false,
                      hint: "Email",
                      isSufix: false,
                      suffixIcon: Text(""),
                      fontFamily: "Century Gothic",
                      fontsize: 0.022,
                      screenWidth: screenWidth,
                      radius: screenWidth * 0.030,
                      PrefixIcon: Icon(
                        Icons.lock_outline,
                        color: Utils.white.withOpacity(0.3),
                      ),
                      screenHeight: screenHeight,
                      editingController: signUpEmailController,
                      isObsecure: false);
                }),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.050,
                    right: screenWidth * 0.050,
                    top: screenWidth * 0.030),
                child:
                    Consumer<SignUpViewModel>(builder: (context, value, child) {
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
                      editingController: signUpPasswordController,
                      isObsecure: value.isHide);
                }),
              ),
              SizedBox(
                height: screenHeight * 0.020,
              ),
              Consumer<SignUpViewModel>(builder: (context, value, child) {
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
              Consumer<SignUpViewModel>(builder: (context, value, child) {
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
                      value.signup(
                          body: UserSignUpModel(
                              email: signUpEmailController.text,
                              password: signUpPasswordController.text,
                              fullname: signUpNameController.text));
                    },
                    child: ButtonContainer(
                      isSimple: false,
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      child: value.isSignUpLoading == true
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Utils.white,
                              ),
                            )
                          : Center(
                              child: Text(
                                "SignUp",
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
                        height: screenHeight * 0.090,
                        width: screenWidth * 0.140,
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
                      height: screenHeight * 0.090,
                      width: screenWidth * 0.140,
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
              // SizedBox(
              //   height: screenHeight * 0.010,
              // ),
              Center(
                child: InkWell(
                  onTap: () {
                    print("Navigating to Login");
                     signUpEmailController.clear();
                    signUpNameController.clear();
                    model.failureResponse = false;
                    signUpPasswordController.clear();
                    model.successResponse = false;
                    model.isSignUpLoading = false;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: Text.rich(
                    TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(
                            color: Utils.white,
                            fontFamily: "Mulish Regular",
                            fontSize: screenHeight * 0.020),
                        children: <TextSpan>[
                          TextSpan(
                              text: " Login",
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
