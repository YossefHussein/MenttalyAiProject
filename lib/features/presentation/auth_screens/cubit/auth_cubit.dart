import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_state.dart';
import 'package:mental_health_app/features/presentation/auth_screens/widgets/widgets.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

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
    }).catchError((error) {
      sendMSG('Error: ${error.toString()}').then((value) {
        emit(SignUpIsNotMatch());
      });
    });
  }

  // go to sign up screen if user doesn't have account
  // void openSignUpScreen({required BuildContext context}) {
  //   Navigator.pushReplacementNamed(context, 'singupScreen');
  //   emit(OpenSignUpScreen());
  // }

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
      // Navigator.pushNamed(context, '/');
      emit(SignUpIsMatchState());
    } else {
      // this is password is not match
      sendMSG('password don\'t match').then((value) {
        emit(SignUpIsNotMatch());
      }).catchError((error){
        sendMSG('${error.toString}');
      });
      return false;
    }
  }

  // login with google
  Future signInWithGoogle() async {
    // Once signed in, return the UserCredential
    try {
      emit(LoginWithGoogleLoading());
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      emit(LoginWithGoogleComplete());
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print(error.toString());
      emit(LoginWithGoogleError(error.toString()));
      sendMSG(error.toString());
    }
  }
}
