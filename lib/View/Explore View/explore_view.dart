import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/app_logo_widget.dart';
import 'package:music_app/Custom%20Widgets/bottom_bar.dart';
import 'package:music_app/Custom%20Widgets/button_container.dart';
import 'package:music_app/Custom%20Widgets/grid_view.dart';
import 'package:music_app/Custom%20Widgets/search_bar.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Explore%20View/explore_viewmodel.dart';
import 'package:provider/provider.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

TextEditingController searchController = TextEditingController();

class _ExploreViewState extends State<ExploreView> {
  @override
  void initState() {
    super.initState();

    // Accessing ExploreViewModel instance and calling fetchingArtist in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExploreViewModel>(context, listen: false).fetchingArtist();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExploreViewModel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Utils.blackPrimary,
      bottomNavigationBar:
          BottomBar(screenHeight: screenHeight, screenWidth: screenWidth),
      body: model.isLoading == true
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            )
          : model.isError == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: Colors.red,
                          size: screenHeight * 0.030,
                        ),
                        SizedBox(
                          width: screenWidth * 0.020,
                        ),
                        Text(
                          'An Error Occured',
                          style: TextStyle(
                              color: Utils.white,
                              fontSize: screenHeight * 0.020,
                              fontFamily: 'Mulish Regular'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    ButtonContainer(
                        isSimple: true,
                        child: Center(
                          child: Text(
                            'Refresh',
                            style: TextStyle(
                                fontFamily: 'Century Gothic Bold',
                                fontSize: screenHeight * 0.018,
                                color: Utils.white),
                          ),
                        ),
                        screenHeight: screenHeight,
                        screenWidth: screenWidth)
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(gradient: Utils.primaryGradient),
                        child: Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.080),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.020),
                                child: Row(
                                  children: [
                                    AppLogoWidget(
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                        imageWidth: 0.080,
                                        imageHeight: 0.080),
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                          color: Utils.searchText,
                                          fontSize: screenHeight * 0.030,
                                          fontFamily: 'Century Gothic Bold'),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.020,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.050,
                                    right: screenWidth * 0.050,
                                  ),
                                  child: SearchBarWidget(
                                    onchanged: () {
                                      print('sdsds');
                                    },
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    editingController: searchController,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.040,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.080),
                        child: Text(
                          'Top Artists',
                          style: TextStyle(
                              letterSpacing: screenWidth * 0.005,
                              color: Utils.white,
                              fontFamily: 'Century Gothic Bold',
                              fontSize: screenHeight * 0.025),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.050),
                        child: GridViewWidget(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            isArtistGrid: true),
                      )
                    ],
                  ),
                ),
    );
  }
}
