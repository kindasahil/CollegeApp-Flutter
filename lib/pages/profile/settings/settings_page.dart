import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gagu/common/routes/names.dart';
import 'package:gagu/common/values/constant.dart';
import 'package:gagu/global.dart';
import 'package:gagu/pages/application/bloc/app_blocs.dart';
import 'package:gagu/pages/application/bloc/app_events.dart';
import 'package:gagu/pages/home/widgets/home_page_widgets.dart';
import 'package:gagu/pages/profile/settings/widgets/settings_widgets.dart';

import 'bloc/settings_blocs.dart';
import 'bloc/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingStates>(
            builder: (context, state) {
          return Container(
            child: Column(
              children: [
                SettingsButton(context, removeUserData),
              ],
            ),
          );
        }),
      ),
    );
  }
}
