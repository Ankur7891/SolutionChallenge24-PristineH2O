
import 'package:flutter/cupertino.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart' hide Badge;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        backgroundColor: Colors.blue,

        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               Image(
                 alignment: AlignmentDirectional.topStart,
                 image: AssetImage("images/NameXLogo.png"),
              ),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.supervised_user_circle_rounded,
                  ),
              )


            ],
          ),
        ],
      ),
      
      bottomNavigationBar: BottomBarBubble(
        // Bubble effect Navigation bar
        color: Colors.blue,
        items: [
          // Add Navigation Items
          BottomBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          BottomBarItem(
            iconData: Icons.work,
            label: 'ML model',
          ),
          BottomBarItem(
            iconData: Icons.email_outlined,
            label: 'Contact Us',
          ),
          BottomBarItem(
            iconData: Icons.timeline,
            label: 'Stream it',
          ),
        ],
        onSelect: (index) {
          // implement your select function here
        },
      ),
    );
  }
}
