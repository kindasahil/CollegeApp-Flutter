import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gagu/common/values/colors.dart';
import 'package:gagu/pages/application/application_widget.dart';
import 'package:gagu/pages/application/bloc/app_blocs.dart';
import 'package:gagu/pages/application/bloc/app_events.dart';
import 'package:gagu/pages/application/bloc/app_states.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);
  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
          ),
        ),
      );
    });
  }
}

Widget buildPage(int index) {
  switch (index) {
    case 0:
      return HomePageWrapper();
    // Add more cases for other pages if needed
    default:
      return Container();
  }
}
