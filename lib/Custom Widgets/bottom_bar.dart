import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:music_app/Services/utils.dart';

int selectedIndex = 0;

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    // required this.selectedIndex,
    required this.listener,
  });

  final double screenHeight;
  // final int selectedIndex;
  final listener;
  final double screenWidth;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Utils.black.withOpacity(0.4),
            Utils.black,
          ],
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          // widget.listener
        },
        selectedItemColor: Utils.bluePrimary,
        unselectedItemColor: Utils.white,
        selectedLabelStyle: TextStyle(
            color: Utils.bluePrimary,
            fontFamily: 'Mulish Regular',
            fontSize: widget.screenHeight * 0.019),
        unselectedLabelStyle: TextStyle(
            color: Utils.white,
            fontFamily: 'Mulish Regular',
            fontSize: widget.screenHeight * 0.019),
        selectedIconTheme: IconThemeData(color: Utils.bluePrimary),
        unselectedIconTheme: IconThemeData(color: Utils.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.folder,
            ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
