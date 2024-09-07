import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/bottom_bar.dart';
import 'package:music_app/Services/global_data.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Track%20View/track_viewmodel.dart';
import 'package:provider/provider.dart';

class TrackView extends StatefulWidget {
  const TrackView(
      {super.key,
      required this.artist_Name,
      required this.artist_Pic,
      required this.artist_genres});

  final String artist_Pic;
  final String artist_Name;
  final List artist_genres;

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
            // Header section
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
            SizedBox(height: screenHeight * 0.030),

            // Artist image
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.100, right: screenWidth * 0.080),
              child: Container(
                height: screenHeight * 0.300,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.020),
                  image: DecorationImage(
                      image: NetworkImage(widget.artist_Pic), fit: BoxFit.fill),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.030),

            // Artist name and genres
            Center(
              child: Column(
                children: [
                  Text(
                    widget.artist_Name,
                    style: TextStyle(
                        color: Utils.white,
                        fontSize: screenHeight * 0.030,
                        fontFamily: 'Century Gothic Bold'),
                  ),
                  SizedBox(height: screenHeight * 0.010),
                  Text(
                    '${widget.artist_genres[0]}, ${widget.artist_genres[1]}',
                    style: TextStyle(
                        color: Utils.white.withOpacity(0.6),
                        fontFamily: 'Century Gothic Bold',
                        fontSize: screenHeight * 0.020),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.030),

            // Track list section
            Expanded(
              child: GlobalData.artistTracks.isNotEmpty
                  ? ListView.builder(
                      itemCount: GlobalData.artistTracks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.010),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: screenHeight * 0.060,
                                width: screenHeight * 0.060, // Add width here
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(GlobalData
                                          .artistTracks[index]['Image']
                                          .toString()),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.040),
                              GlobalData.artistTracks[index]['Track Name'] ==
                                      'COME THROUGH (feat. Abdullah Maharvi & Talha Anjum)'
                                  ? Text(
                                      'COME THROUGH'.toString(),
                                      style: TextStyle(
                                        color: Utils.white,
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    )
                                  : Text(
                                      GlobalData.artistTracks[index]
                                              ['Track Name']
                                          .toString(),
                                      style: TextStyle(
                                        color: Utils.white,
                                        fontSize: screenHeight * 0.018,
                                      ),
                                    ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No tracks available',
                        style: TextStyle(
                          color: Utils.white.withOpacity(0.5),
                          fontSize: screenHeight * 0.022,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
