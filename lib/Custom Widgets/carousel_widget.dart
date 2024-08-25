import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.isMixes});
  final double screenHeight;
  final double screenWidth;
  // final double itemExtent;
  final bool isMixes;

  @override
  Widget build(BuildContext context) {
    if (isMixes == true) {
      return SizedBox(
        height: screenHeight * 0.200,
        // width: screenWidth * 0.100,
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.020),
          child: CarouselView(
            padding: EdgeInsets.only(right: screenWidth * 0.100),
            itemSnapping: true,
            itemExtent: screenWidth - 200, // Specify the extent of each item
            children: [
              Container(
                // height: screenHeight *
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Utils.gridColorOne.withOpacity(0.1),
                  Utils.gridColorTwo.withOpacity(0.2)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                child: Center(child: Text('Item 1')),
              ),
              Container(
                // height: screenHeight *
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Utils.gridColorOne.withOpacity(0.1),
                  Utils.gridColorTwo.withOpacity(0.2)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                child: Center(child: Text('Item 2')),
              ),
              Container(
                // height: screenHeight *
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Utils.gridColorOne.withOpacity(0.1),
                  Utils.gridColorTwo.withOpacity(0.2)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                child: Center(child: Text('Item 3')),
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox(
      height: screenHeight * 0.250,
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.020),
        child: CarouselView(
            padding: EdgeInsets.only(right: screenWidth * 0.160),
            itemSnapping: true,
            itemExtent: screenWidth - 100,
            children: [
              Container(
                height: screenHeight * 0.300, // Explicit height
                width: screenWidth - 100,
                // height: screenHeight *
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Utils.gridColorOne.withOpacity(0.1),
                  Utils.gridColorTwo.withOpacity(0.2)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                child: Center(child: Text('Item 1')),
              ),
              Container(
                // height: screenHeight *
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Utils.gridColorOne.withOpacity(0.1),
                  Utils.gridColorTwo.withOpacity(0.2)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                child: Center(child: Text('Item 2')),
              ),
              Container(
                // height: screenHeight *
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Utils.gridColorOne.withOpacity(0.1),
                  Utils.gridColorTwo.withOpacity(0.2)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                child: Center(child: Text('Item 3')),
              ),
            ]),
      ),
    );
  }
}
