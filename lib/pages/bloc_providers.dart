import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gagu/pages/register/bloc/register_blocs.dart';
import 'package:gagu/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:gagu/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        //BlocProvider(lazy:false,create : (context) => AppBlocs()),

        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBlocs()),
      ];
}
