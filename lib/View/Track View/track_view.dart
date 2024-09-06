import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class TrackView extends StatefulWidget {
  const TrackView({super.key});

  @override
  State<TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Utils.blackPrimary,
    );
  }
}