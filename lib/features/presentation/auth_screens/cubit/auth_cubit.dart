import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_state.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';


class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  // login on app by firebase but that by email
  Future signInByEmail() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      // this for give data from field and move to firebase
      // 'trim()' mean give me text without this '
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((value) {
      emit(SignInEmailState());
    });
  }

  // go to sign up screen if user doesn't have account
  void openSignUpScreen({required BuildContext context}) {
    Navigator.pushReplacementNamed(context, 'singupScreen');
    emit(OpenSignUpScreen());
  }

  // signUp on app by firebase
  Future signUpByEmail(BuildContext context) async {
    // if password is not match give for user message the
    //password is not match
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      // this for add email and password to database if password match
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        // this for give data from field and move to firebase
        // 'trim()' mean give me text without this '
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // this for go to auth screen
      Navigator.pushNamed(context, '/');
      emit(SignUpIsMatchState());
    } else {
      // this is password is not match
      notPasswordMatch('password don\'t match').then((value) {
        emit(SignUpIsNotMatch());
      });
      return false;
    }
  }
}
