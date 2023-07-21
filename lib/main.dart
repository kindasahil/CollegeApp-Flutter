import 'package:gagu/common/routes/pages.dart';
import 'package:gagu/common/values/colors.dart';
import 'package:gagu/pages/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common/routes/routes.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      // providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                      iconTheme: IconThemeData(
                        color: AppColors.primaryText,
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white),
                ),
                // home: const ApplicationPage(),
                // home: const Welcome(),
                onGenerateRoute: AppPages.GenerateRouteSettings,
                initialRoute: "/",
                // routes: {
                // "myHomePage": (context) => const MyHomePage(),
                // "signIn": (context) => const SignIn(),
                // "register": (context) => const Register()
                // },
              )),
    );
  }
}
