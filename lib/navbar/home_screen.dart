import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_provider/navbar/getx_controller/common_controller.dart';
import 'package:learn_provider/navbar/my_profile.dart';
import 'package:learn_provider/navbar/search_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final commonControllerCnt = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: commonControllerCnt.pageController.value,
            children: const [
              Center(child: Text("Home")),
              SearchScreen(),
              Center(child: Text("Events")),
              MyProfile(),
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
            child: SlidingClippedNavBar(
              fontSize: 17,
              backgroundColor: Colors.grey.shade300,
              onButtonPressed: (index) {
                commonControllerCnt.selectedIndex.value = index;
                commonControllerCnt.pageController.value.animateToPage(
                    commonControllerCnt.selectedIndex.value,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutQuad);
              },
              iconSize: 30,
              activeColor: Colors.purple,
              // inactiveColor: Colors.purple.shade200,
              selectedIndex: commonControllerCnt.selectedIndex.value,
              barItems: [
                BarItem(
                  icon: Icons.home,
                  title: 'Home',
                ),
                BarItem(
                  icon: Icons.search_rounded,
                  title: 'Search',
                ),
                BarItem(
                  icon: Icons.event,
                  title: 'Events',
                ),
                BarItem(
                  icon: Icons.settings,
                  title: 'My Profile',
                ),

                /// Add more BarItem if you want
              ],
            ),
          ),
        ),
      ),
    );
  }
}
