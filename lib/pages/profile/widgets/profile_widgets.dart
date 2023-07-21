import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gagu/common/routes/names.dart';
import 'package:gagu/common/values/colors.dart';
import 'package:gagu/common/widgets/base_text_widgets.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          //size set of menu icon in profile remaning
          width: 25.w,
          height: 25.h,
          child: Image.asset("assets/icons/menu.png"),
        ),
        reusableText("Profile"),
        SizedBox(
          //size set of menu icon in profile remaning
          width: 25.w,
          height: 25.h,
          child: Image.asset("assets/icons/more-vertical.png"),
        ),
      ],
    )),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    child: Image(
        width: 25.w,
        height: 25.h,
        image: AssetImage("assets/icons/edit_3.png")),
  );
}

var ImagesInfo = <String, String>{
  "Personal Information": "personal-info.png",
  "My Courses": "course.png",
  "Class Schedule": "class.png",
  "Help and support": "help.png",
  "Settings": "setingsuser.png"
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        ImagesInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          child: Container(
              margin: EdgeInsets.only(bottom: 15.h),
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                        "assets/icons/${ImagesInfo.values.elementAt(index)}"),
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.w),
                        // changed colour
                        color: Colors.white),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    ImagesInfo.keys.elementAt(index),
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              )),
        ),
      ),
    ],
  );
}
