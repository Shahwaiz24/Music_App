import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class TextFieldWigdet extends StatefulWidget {
  const TextFieldWigdet(
      {super.key,
      required this.isSearch,
      required this.editingController,
      required this.isObsecure,
      required this.suffixIcon,
      required this.isSufix,
      required this.hint,
      required this.fontFamily,
      required this.screenHeight,
      required this.radius,
      required this.PrefixIcon,
      required this.fontsize,
      required this.screenWidth});

  final TextEditingController editingController;
  final bool isObsecure;
  final String hint;
  final bool isSearch;
  final double screenHeight;
  final fontsize;
  final Widget suffixIcon;
  final bool isSufix;
  final fontFamily;
  final double screenWidth;
  final Widget PrefixIcon;
  final radius;

  @override
  State<TextFieldWigdet> createState() => _TextFieldWigdetState();
}

class _TextFieldWigdetState extends State<TextFieldWigdet> {
  @override
  Widget build(BuildContext context) {
    if (widget.isSearch == false) {
      return TextFormField(
        controller: widget.editingController,
        obscureText: widget.isObsecure,
        style: TextStyle(color: Utils.white.withOpacity(0.9)),
        obscuringCharacter: "*",
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
              color: Utils.white.withOpacity(0.9),
              fontSize: widget.screenHeight * widget.fontsize,
              fontFamily: widget.fontFamily),
          prefixIcon: widget.PrefixIcon,
          suffixIcon: widget.isSufix == true ? widget.suffixIcon : Text(""),
          filled: true,
          fillColor: Utils.blackPrimary, // Background color for the text field
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(widget.radius), // Circular corners
            borderSide: BorderSide(
              color: Utils.white.withOpacity(0.4), // Color of the border
              width: 1, // Width of the border (stroke)
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(
              color: Utils.white.withOpacity(0.4),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide(
              color: Utils.white.withOpacity(0.4), // Color when focused
              width: 1,
            ),
          ),
        ),
      );
    }
    return TextFormField(
      controller: widget.editingController,
      style: TextStyle(color: Utils.white.withOpacity(0.9)),
      decoration: InputDecoration(
          filled: true,
          fillColor: Utils.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.circular(widget.screenWidth * widget.radius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.circular(widget.screenWidth * widget.radius),
          ),
          enabled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.circular(widget.screenWidth * widget.radius),
          ),
          hintText: widget.hint,
          hintStyle: TextStyle(
              fontSize: widget.screenHeight * widget.fontsize,
              fontFamily: widget.fontFamily,
              color: Utils.white.withOpacity(0.4))),
    );
  }
}
