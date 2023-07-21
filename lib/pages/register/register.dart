import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gagu/pages/register/bloc/register_blocs.dart';
import 'package:gagu/pages/register/register_controller.dart';
import 'package:gagu/pages/sign_in/bloc/sign_in_blocs.dart';

import '../commom_widgets.dart';
import '../sign_in/bloc/sign_in_events.dart';
import '../sign_in/bloc/signin_states.dart';
import '../sign_in/sign_in_controller.dart';
import 'bloc/register_events.dart';
import 'bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppbar("SignUp"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText(
                          "Enter your Details below and Free Sign-Up")),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("User Name"),
                          buildTextField("Enter your username", "name", "user",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(UserNameEvent(value));
                          }),
                          reusableText("E-Mail"),
                          buildTextField(
                              "Enter your E-Mail address", "email", "user",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(RegisterEmailEvent(value));
                          }),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your Password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(RegisterPasswordEvent(value));
                          }),
                          reusableText("Confirm Password"),
                          buildTextField(
                              "Re-Enter your Password", "password", "lock",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(ConfirmPasswordEvent(value));
                          })
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: reusableText(
                        "By creating an account you have to agree with our  terms and conditions."),
                  ),
                  buildLogInAndRegButton("Sign up", "login", () {
                    //Navigator.of(context).pushNamed("register");
                    RegisterController(context: context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
