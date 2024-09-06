import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/bottom_bar.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Track%20View/track_viewmodel.dart';
import 'package:provider/provider.dart';

class TrackView extends StatefulWidget {
  const TrackView({super.key});

  @override
  State<TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TrackViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      bottomNavigationBar:
          BottomBar(screenHeight: screenHeight, screenWidth: screenWidth),
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.070,
            left: screenWidth * 0.040,
            right: screenWidth * 0.070),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Utils.white,
                    size: screenHeight * 0.040,
                  ),
                ),
                Text(
                  'Artist Name \n Details',
                  style: TextStyle(
                      color: Utils.white.withOpacity(0.5),
                      fontSize: screenHeight * 0.020,
                      fontFamily: 'Century Gothic'),
                ),
                // Icon(Icons.)
              ],
            )
          ],
        ),
      ),
    );
  }
}
