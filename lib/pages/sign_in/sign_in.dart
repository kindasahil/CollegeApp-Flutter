import 'package:gagu/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:gagu/pages/sign_in/bloc/sign_in_events.dart';
import 'package:gagu/pages/sign_in/bloc/signin_states.dart';
import 'package:gagu/pages/sign_in/sign_in_controller.dart';
// import 'package:gagu/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../commom_widgets.dart';
import '../register/bloc/register_events.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppbar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusableText("Or Use Your E-Mail Account To Log-in")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("E-mail"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your E-Mail Address", "email", "user",
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              "Enter your Password", "password", "lock",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          })
                        ]),
                  ),
                  forgotPassword(),
                  buildLogInAndRegButton("LogIn", "login", () {
                    SignInController(context: context).handleSignIn("email");
                  }),
                  buildLogInAndRegButton("Sign up", "register", () {
                    Navigator.of(context).pushNamed("/register");
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
