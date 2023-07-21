import 'package:firebase_auth/firebase_auth.dart';
import 'package:gagu/common/values/constant.dart';
import 'package:gagu/common/widgets/flutter_toast.dart';
import 'package:gagu/global.dart';
import 'package:gagu/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "you need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "you need to fill email password");
          return;
        }
        try {
          final Credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (Credential.user == null) {
            toastInfo(msg: "you do not exist");
            return;
          }
          if (!Credential.user!.emailVerified) {
            toastInfo(msg: "you need to verify your email account");
            return;
          }

          var user = Credential.user;
          if (user != null) {
            print("user exist");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");

            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //we hve error getting user from firebase
            toastInfo(msg: "currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("no user found for that email.");
            toastInfo(msg: "no user found fot that email");
          } else if (e.code == 'wrong-password') {
            print("wrong password provided for that user.");
            toastInfo(msg: "the password is wrong for that user");
          } else if (e.code == 'invalid-email') {
            print("your email format is wrong");
            toastInfo(msg: "your email address format is wrong");
          }
        } catch (e) {
          print(e.toString());
        }
      }
    } catch (e) {}
  }
}
