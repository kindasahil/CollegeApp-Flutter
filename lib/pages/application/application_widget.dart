import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gagu/pages/application/gallaryscreen.dart';
import 'package:gagu/pages/application/newsfeedscreen.dart';
import 'package:gagu/pages/application/todo.dart';
import 'package:gagu/pages/home/home_page.dart';
import 'package:gagu/pages/profile/profile.dart';

import '../../common/values/colors.dart';

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({Key? key}) : super(key: key);

  @override
  _HomePageWrapperState createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          children: [
            const HomePage(),
            TodoList(),
            GalleryScreen(),
            NewsFeedScreen(),
            const ProfilePage(),
          ],
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          items: bottomTabs,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: AppColors.primaryElement),
          onTap: (int index) {
            setState(() {
              currentPage = index;
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
        ));
  }
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/11.png"),
    ),
  ),
  BottomNavigationBarItem(
    label: "To-Do",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/todo.png"),
    ),
  ),
  BottomNavigationBarItem(
    label: "Gallery",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/33.png"),
    ),
  ),
  BottomNavigationBarItem(
    label: "News",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/44.png"),
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/55.png"),
    ),
  ),
];
