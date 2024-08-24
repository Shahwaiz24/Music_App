import 'package:flutter/material.dart';
import 'package:music_app/Custom%20Widgets/bottom_bar.dart';
import 'package:music_app/Custom%20Widgets/button_container.dart';
import 'package:music_app/Custom%20Widgets/grid_view.dart';
import 'package:music_app/Services/user_data.dart';
import 'package:music_app/Services/utils.dart';
import 'package:music_app/View/Home%20View/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    HomeViewmodel.getUserdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    model.getStats();

    return Scaffold(
      bottomNavigationBar: BottomBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      ),
      backgroundColor: Utils.blackPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(gradient: Utils.primaryGradient),
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.080),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
                      child: Row(
                        children: [
                          Container(
                            height: screenHeight * 0.100,
                            width: screenWidth * 0.120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Utils.bluePrimary,
                                    width: screenWidth * 0.005)),
                            child: const Image(
                                image: AssetImage('assets/image/person.png')),
                          ),
                          SizedBox(
                            width: screenWidth * 0.040,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.015),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back !',
                                  style: TextStyle(
                                      color: Utils.white,
                                      fontSize: screenHeight * 0.022,
                                      fontFamily: 'Century Gothic Bold'),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.001,
                                ),
                                Text(
                                  UserData.userdata['fullname'],
                                  style: TextStyle(
                                      color: Utils.white.withOpacity(0.6),
                                      fontSize: screenHeight * 0.019,
                                      fontFamily: 'Century Gothic Bold'),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: () {
                                print('Stats');
                              },
                              child: Icon(
                                Icons.trending_up_outlined,
                                color: Utils.white,
                                size: screenHeight * 0.032,
                              )),
                          SizedBox(
                            width: screenWidth * 0.030,
                          ),
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Utils.white,
                            size: screenHeight * 0.032,
                          ),
                          SizedBox(
                            width: screenWidth * 0.030,
                          ),
                          Icon(
                            Icons.settings_outlined,
                            color: Utils.white,
                            size: screenHeight * 0.032,
                          ),
                          SizedBox(
                            width: screenWidth * 0.010,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            model.isExplore == true
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You Have to Explore First',
                          style: TextStyle(
                              color: Utils.white,
                              fontFamily: 'Mulish Regular',
                              fontSize: screenHeight * 0.020),
                        ),
                        SizedBox(
                          height: screenHeight * 0.020,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.180),
                          child: InkWell(
                            onTap: () {
                              print('Navigate to Explore');
                            },
                            child: ButtonContainer(
                              isSimple: true,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              child: Center(
                                child: Text(
                                  'Explore',
                                  style: TextStyle(
                                      color: Utils.white,
                                      fontFamily: 'Mulish Regular',
                                      fontSize: screenHeight * 0.018),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.030),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.050),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Continue Listening',
                              style: TextStyle(
                                  color: Utils.white,
                                  fontFamily: 'Century Gothic Bold',
                                  fontSize: screenHeight * 0.025),
                            ),
                            SizedBox(
                              height: screenHeight * 0.020,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0, right: screenHeight * 0.020),
                              child: GridViewWidget(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.030,
                            ),
                            Text(
                              'Your Top Mixes',
                              style: TextStyle(
                                  color: Utils.white,
                                  fontFamily: 'Century Gothic Bold',
                                  fontSize: screenHeight * 0.025),
                            )
                            // CarouselView(itemExtent: 2, children: [
                            //   Container(
                            //     height: screenHeight * 0.040,
                            //     color: Utils.white,
                            //     margin:
                            //         EdgeInsets.only(left: screenWidth * 0.030),
                            //   ),
                            //   Container(
                            //     height: screenHeight * 0.040,
                            //     color: Utils.white,
                            //     margin:
                            //         EdgeInsets.only(left: screenWidth * 0.030),
                            //   )
                            // ])
                          ],
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
