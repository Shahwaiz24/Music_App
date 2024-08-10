import 'package:flutter/material.dart';

class AppLogoWidget extends StatefulWidget {
  const AppLogoWidget(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.imageWidth,
      required this.imageHeight});
  final double screenHeight;
  final double screenWidth;
  final imageHeight;
  final imageWidth;
  @override
  State<AppLogoWidget> createState() => _AppLogoWidgetState();
}

class _AppLogoWidgetState extends State<AppLogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        "assets/image/logo.png",
      ),
      height: widget.screenHeight * widget.imageHeight,
    );
  }
}
