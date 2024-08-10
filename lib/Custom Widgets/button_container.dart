import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class ButtonContainer extends StatefulWidget {
  ButtonContainer(
      {super.key,
      required this.isSimple,
      required this.child,
      required this.screenHeight,
      required this.screenWidth});
  final bool isSimple;
  final Widget child;
  final double screenHeight;
  final double screenWidth;
  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  @override
  Widget build(BuildContext context) {
    if (widget.isSimple == true) {
      return Container();
    }
    return Container(
      height: widget.screenHeight * 0.070,
      decoration: BoxDecoration(
          color: Utils.bluePrimary,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(widget.screenWidth * 0.070),
              right: Radius.circular(widget.screenWidth * 0.070))),
      child: widget.child
    );
  }
}
