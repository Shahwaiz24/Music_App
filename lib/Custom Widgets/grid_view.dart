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
      itemCount: 6, // Total 6 items
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: widget.screenHeight * 0.120,
          width: widget.screenWidth * 0.050,
          color: Colors.red, // Container background color
          child: Text(
            'Item $index',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
    );
  }
}
