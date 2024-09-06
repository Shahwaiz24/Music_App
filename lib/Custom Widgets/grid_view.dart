import 'package:flutter/material.dart';
import 'package:music_app/Services/global_data.dart';
import 'package:music_app/Services/utils.dart';

int selectedIndex = 0;

class GridViewWidget extends StatefulWidget {
  const GridViewWidget(
      {super.key,
      required this.screenHeight,
      required this.ontapFunction,
      required this.screenWidth,
      required this.isArtistGrid});
  final double screenHeight;
  final double screenWidth;
  final bool isArtistGrid;
  final Function(int index) ontapFunction; 
  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isArtistGrid == true
        ? GridView.builder(
            itemCount: GlobalData.artist.length,
            padding: EdgeInsets.only(top: widget.screenHeight * 0.020),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: widget.screenWidth * 0.080,
                mainAxisSpacing: widget.screenHeight * 0.020,
                mainAxisExtent:
                    widget.screenHeight * 0.230), // Increased height
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  selectedIndex = index;
                  widget.ontapFunction(selectedIndex);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:
                          widget.screenWidth * 0.3, // Adjust the size as needed
                      height:
                          widget.screenWidth * 0.3, // Adjust the size as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          alignment: Alignment.center,
                          image: NetworkImage(
                              GlobalData.artist[index]['Profile Pic']),
                          fit: BoxFit
                              .cover, // Cover the container with the image
                        ),
                      ),
                    ),
                    SizedBox(
                        height: widget.screenHeight *
                            0.010), // Space between image and text
                    Text(
                      GlobalData.artist[index]
                          ['Artist Name'], // Replace with your artist name
                      style: TextStyle(
                        fontFamily: 'Century Gothic Bold',

                        color: Utils.white,
                        fontSize: widget.screenHeight *
                            0.020, // Adjust font size as needed
                      ),
                    ),
                  ],
                ),
              );
            })
        : GridView.builder(
            itemCount: 6,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: widget.screenWidth * 0.035,
                mainAxisSpacing: widget.screenHeight * 0.015,
                mainAxisExtent: widget.screenHeight * 0.070),
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            widget.screenWidth * 0.035,
                          ),
                          bottomRight: Radius.circular(
                            widget.screenWidth * 0.035,
                          )),
                      gradient: LinearGradient(
                          colors: [
                            Utils.gridColorOne.withOpacity(0.1),
                            Utils.gridColorTwo.withOpacity(0.2)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment
                              .centerRight)), // Container background color
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Image${index}',
                        style: TextStyle(color: Utils.white),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: widget.screenWidth * 0.030),
                        child: Text(
                          'Track Name',
                          style: TextStyle(color: Utils.white),
                        ),
                      )
                    ],
                  ));
            },
          );
  }
}
