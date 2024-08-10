import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class GetinView extends StatefulWidget {
  const GetinView({super.key});

  @override
  State<GetinView> createState() => _GetinViewState();
}

class _GetinViewState extends State<GetinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.blackPrimary,
    );
  }
}
