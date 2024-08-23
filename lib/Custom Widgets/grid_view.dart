import 'package:flutter/material.dart';

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
      itemCount: 4,
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
          // height: 100,
          // width: widget.screenWidth * 0.050,
          color: Colors.red, // Container background color
          child: Center(
            child: Text(
              'Item $index',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
