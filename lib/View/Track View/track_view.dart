import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/bottom_bar.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Track%20View/track_viewmodel.dart';
import 'package:provider/provider.dart';

class TrackView extends StatefulWidget {
  const TrackView(
      {super.key, required this.artist_Name, required this.artist_Pic});

  final String artist_Pic;
  final String artist_Name;

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
            right: screenWidth * 0.060),
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
                  'Artist Details',
                  style: TextStyle(
                      color: Utils.white.withOpacity(0.5),
                      fontSize: screenHeight * 0.021,
                      fontFamily: 'Century Gothic'),
                ),
                Icon(
                  Icons.more_vert_sharp,
                  color: Utils.white,
                  size: screenHeight * 0.035,
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.100, right: screenWidth * 0.080),
              child: Container(
                height: screenHeight * 0.300,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.020),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.artist_Pic.toString(),
                      ),
                      fit: BoxFit.fill),

                  // color: Utils.bluePrimary,

                  border: Border.all(color: Utils.white, width: 1),
                  // borderRadius: BorderRadius.circular(100)
                ),
              
              ),
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Center(
              child: Text(
                widget.artist_Name.toString(),
                style: TextStyle(
                    color: Utils.white,
                    fontSize: screenHeight * 0.030,
                    fontFamily: 'Century Gothic Bold'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
