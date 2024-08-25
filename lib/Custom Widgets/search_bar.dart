import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget(
      {super.key,
      required this.screenHeight,
      required this.onchanged(),
      required this.screenWidth,
      required this.editingController});

  final TextEditingController editingController;
  final double screenHeight;
  final double screenWidth;
  final Function onchanged;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget.onchanged();
      },
      controller: widget.editingController,
      style: TextStyle(color: Utils.black.withOpacity(0.9)),
      decoration: InputDecoration(
          filled: true,
          fillColor: Utils.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.screenWidth * 0.060),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.screenWidth * 0.060),
          ),
          enabled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(widget.screenWidth * 0.060),
          ),
          hintText: 'Search Artist',
          prefixIcon: Icon(
            Icons.search_outlined,
            color: Utils.black.withOpacity(0.4),
          ),
          hintStyle: TextStyle(
              fontSize: widget.screenHeight * 0.019,
              fontFamily: 'Mulish Regular',
              color: Utils.searchHint)),
    );
  }
}
