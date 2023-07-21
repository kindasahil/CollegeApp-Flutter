import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gagu/common/values/colors.dart';
import 'package:gagu/pages/home/home_page.dart';

import '../../../common/widgets/base_text_widgets.dart';
import '../bloc/home_page_blocs.dart';
import '../bloc/home_page_events.dart';
import '../bloc/home_page_states.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
        margin: EdgeInsets.only(left: 7.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: Image.asset("assets/icons/manu.png"),
            ),
            GestureDetector(
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/02.png"))),
              ),
            )
          ],
        )),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: "Search your course",
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: const TextStyle(
                      color: AppColors.primarySecondaryElementText),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp,
                ),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

// for sliders view
Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(path: "assets/images/1.png"),
            _slidersContainer(path: "assets/images/2.jpeg"),
            _slidersContainer(path: "assets/images/3.jpeg"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

// sliders widget
Widget _slidersContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

//menu view for showing items
Widget menuView() {
  return Column(
    children: [
      Container(
          width: 325.h,
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              reusableText("Choose your course"),
              GestureDetector(
                  child: reusableText("See all",
                      color: AppColors.primaryThreeElementText, fontSize: 15))
            ],
          )),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(children: [
          _reusableMenuText("Our Courses"),
          // _reusableMenuText("Popular",
          //     textColor: AppColors.primaryThreeElementText,
          //     backGroundColor: Colors.white),
          // _reusableMenuText("New & Hot",
          //     textColor: AppColors.primaryThreeElementText,
          //     backGroundColor: Colors.white),
        ]),
      )
    ],
  );
}

//for the menu button and reuasble menu text
Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(top: 20.w),
    child: Row(children: [
      Container(
        margin: EdgeInsets.only(right: 20.w),
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(7.w),
            border: Border.all(color: backGroundColor)),
        child: reusableText(menuText,
            color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
      )
    ]),
  );
}

//for course grid ui
Widget courseGrid(BuildContext context) {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 0.8, // Adjust this value to change the size
    children: [
      GestureDetector(
        onTap: () {
          // Navigate to the first course screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SampleNextScreen(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/ai1.jpg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Artificial Intelligence",
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: false,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0, // Adjust this value to change the font size
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Course 1",
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: false,
                style: TextStyle(
                  color: AppColors.primaryFourElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0, // Adjust this value to change the font size
                ),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          // Navigate to the second course screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SampleNextScreen2(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/cs2.jpg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cyber Security",
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: false,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0, // Adjust this value to change the font size
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Course 2",
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: false,
                style: TextStyle(
                  color: AppColors.primaryFourElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0, // Adjust this value to change the font size
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

// on tap vala feature
class SampleNextScreen extends StatefulWidget {
  @override
  _SampleNextScreenState createState() => _SampleNextScreenState();
}

class _SampleNextScreenState extends State<SampleNextScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ai Course'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF348FED),
              Color(0xFF4E55E5),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Handle image tap event
              },
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/images/ai1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    onPressed: () {
                      // Handle favorite button tap event
                      toggleFavorite();
                    },
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Artificial Intelligence',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Instructor: John Doe',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Duration: 8 weeks',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Course Description:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Unleash the power of Artificial Intelligence! Dive into cutting-edge algorithms, machine learning techniques, and real-world applications. Join us to revolutionize your app development skills and become a sought-after AI expert. Enroll today!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle enroll button tap event
              },
              child: Text(
                'Enroll Now',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Color(0xFF4E55E5),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SampleNextScreen2 extends StatefulWidget {
  @override
  _SampleNextScreen2State createState() => _SampleNextScreen2State();
}

class _SampleNextScreen2State extends State<SampleNextScreen2> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyber Security Course'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEF6C00),
              Color(0xFFBF360C),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Handle image tap event
              },
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/images/cs2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    onPressed: () {
                      // Handle favorite button tap event
                      toggleFavorite();
                    },
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Cyber Security',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Instructor: Jane Smith',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Duration: 12 weeks',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Course Description:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Learn to protect computer systems and networks from digital attacks. Explore various security measures, ethical hacking techniques, and incident response strategies. Join us to develop the skills needed to safeguard against cyber threats. Enroll today!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle enroll button tap event
              },
              child: Text(
                'Enroll Now',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Color(0xFFBF360C),
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
