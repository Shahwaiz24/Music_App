import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class TextFieldWigdet extends StatefulWidget {
  const TextFieldWigdet(
      {super.key,
      required this.editingController,
      required this.isObsecure,
      required this.hint,
      required this.fontFamily,
      required this.screenHeight,
      required this.radius,
      required this.fontsize,
      required this.screenWidth});

  final TextEditingController editingController;
  final bool isObsecure;
  final String hint;
  final double screenHeight;
  final fontsize;
  final fontFamily;
  final double screenWidth;
  final radius;

  @override
  State<TextFieldWigdet> createState() => _TextFieldWigdetState();
}

class _TextFieldWigdetState extends State<TextFieldWigdet> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.editingController,
      obscureText: widget.isObsecure,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
            color: Utils.white.withOpacity(0.5),
            fontSize: widget.screenHeight * widget.fontsize,
            fontFamily: widget.fontFamily),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Utils.white.withOpacity(0.3),
        ),
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
}
