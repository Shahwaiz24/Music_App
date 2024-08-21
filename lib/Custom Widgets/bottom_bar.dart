import 'package:flutter/material.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Home%20View/home_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
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
      child: Consumer<HomeViewmodel>(
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: value.selectedIndex,
            onTap: (index) {
              value.ontap(index: index, context: context);
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
          );
        },
      ),
    );
  }
}
