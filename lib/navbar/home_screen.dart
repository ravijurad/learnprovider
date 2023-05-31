import 'package:flutter/material.dart';
import 'package:learn_provider/navbar/search_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BottomHomeScreen extends StatefulWidget {
  const BottomHomeScreen({Key? key}) : super(key: key);

  @override
  State<BottomHomeScreen> createState() => _BottomHomeScreenState();
}

class _BottomHomeScreenState extends State<BottomHomeScreen> {
  PageController controller = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          Center(child: Text("Home")),
          SearchScreen(),
          Center(child: Text("Events")),
          Center(child: Text("Settings")),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        child: SlidingClippedNavBar(
          fontSize: 17,
          backgroundColor: Colors.grey.shade300,
          onButtonPressed: (index) {
            setState(() {
              selectedIndex = index;
            });
            controller.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutQuad);
          },
          iconSize: 30,
          activeColor: Colors.purple,
          // inactiveColor: Colors.purple.shade200,
          selectedIndex: selectedIndex,
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
              title: 'Settings',
            ),

            /// Add more BarItem if you want
          ],
        ),
      ),
    );
  }
}
