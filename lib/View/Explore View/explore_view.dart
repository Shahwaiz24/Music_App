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
  Widget build(BuildContext context) {
    final model = Provider.of<ExploreViewModel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Utils.blackPrimary,
        bottomNavigationBar:
            BottomBar(screenHeight: screenHeight, screenWidth: screenWidth),
        body: FutureBuilder(
          future: model.fetchingArtist(),
          builder: (context, snapshot) {
            return Consumer<ExploreViewModel>(builder: (context, model, child) {
              if (model.isLoading == true) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Utils.bluePrimary,
                  ),
                );
              } else if (model.isError == true) {
                return model.isTrackError
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  color: Colors.red,
                                  size: screenHeight * 0.030,
                                ),
                                SizedBox(width: screenWidth * 0.020),
                                Text(
                                  'An Error Occurred',
                                  style: TextStyle(
                                    color: Utils.white,
                                    fontSize: screenHeight * 0.020,
                                    fontFamily: 'Mulish Regular',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.020),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.150),
                              child: InkWell(
                                onTap: () async {},
                                child: ButtonContainer(
                                  isSimple: true,
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  child: Center(
                                    child: Text(
                                      'Refresh',
                                      style: TextStyle(
                                        fontFamily: 'Century Gothic Bold',
                                        fontSize: screenHeight * 0.022,
                                        color: Utils.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline_rounded,
                                  color: Colors.red,
                                  size: screenHeight * 0.030,
                                ),
                                SizedBox(width: screenWidth * 0.020),
                                Text(
                                  'An Error Occurred',
                                  style: TextStyle(
                                    color: Utils.white,
                                    fontSize: screenHeight * 0.020,
                                    fontFamily: 'Mulish Regular',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.020),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.150),
                              child: InkWell(
                                onTap: () async {
                                  await model.refreshToken();
                                  // await model.fetchingArtist();
                                },
                                child: ButtonContainer(
                                  isSimple: true,
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  child: Center(
                                    child: Text(
                                      'Refresh',
                                      style: TextStyle(
                                        fontFamily: 'Century Gothic Bold',
                                        fontSize: screenHeight * 0.022,
                                        color: Utils.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(gradient: Utils.primaryGradient),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.060,
                              bottom: screenHeight * 0.020),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.030),
                                child: Row(
                                  children: [
                                    AppLogoWidget(
                                        screenHeight: screenHeight,
                                        screenWidth: screenWidth,
                                        imageWidth: 0.080,
                                        imageHeight: 0.080),
                                    SizedBox(width: screenWidth * 0.020),
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Utils.searchText,
                                        fontSize: screenHeight * 0.030,
                                        fontFamily: 'Century Gothic Bold',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.020),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.040),
                                child: SearchBarWidget(
                                  onchanged: () {},
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth,
                                  editingController: searchController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.020),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.040),
                        child: Text(
                          'Top Artists',
                          style: TextStyle(
                            letterSpacing: screenWidth * 0.005,
                            color: Utils.white,
                            fontFamily: 'Century Gothic Bold',
                            fontSize: screenHeight * 0.025,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.040),
                        child: GridViewWidget(
                          ontapFunction: (int index) async {
                          await  model.fetchingTrack(index: index);
                          },
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          isArtistGrid: true,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.020),
                    ],
                  ),
                );
              }
            });
          },
        ));
  }
}
