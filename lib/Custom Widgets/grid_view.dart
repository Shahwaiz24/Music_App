import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      padding: EdgeInsets.zero,

      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // Total 6 items
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
                    end: Alignment.centerRight)), // Container background color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Image${index}',
                  style: TextStyle(color: Utils.white),
                ),
                Padding(
                  padding: EdgeInsets.only(left: widget.screenWidth * 0.030),
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
