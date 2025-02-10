import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mental_health_app/core/theme.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:mental_health_app/features/presentation/auth_screens/cubit/auth_state.dart';
import 'package:mental_health_app/features/presentation/auth_screens/pages/logup_page.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var cubit = AuthCubit();
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                  child: Platform.isAndroid || Platform.isIOS
                      ? Image.asset(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          'assets/onboarding.png',
                          fit: BoxFit.fitWidth,
                        )
                      : Image.network(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          'https://images.pexels.com/photos/1051838/pexels-photo-1051838.jpeg',
                          fit: BoxFit.fitWidth,
                        )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AutoSizeTextField(
                      maxLines: 1,
                      controller: cubit.emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: DefaultColors.pink,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AutoSizeTextField(
                      maxLines: 1,
                      controller: cubit.passwordController,
                      obscureText: obscureText,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).focusColor,
                          ),
                          onPressed: () {
                            // Update the state i.e. toggle the state of passwordVisible variable
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Theme.of(context).focusColor,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: DefaultColors.pink,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // login with email
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            cubit.signInByEmail();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).focusColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                            size: 26,
                          ),
                          label: Text(
                            'LogIn With Email',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // login with google
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            cubit.signInWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).focusColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: Icon(
                            FontAwesome.google_brand,
                            color: Colors.white,
                            size: 26,
                          ),
                          label: Text(
                            'LogIn With Google',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        'If You Dose Not Have Account?',
                        style: TextStyle(
                          color: DefaultColors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogUpScreen(),
                            ),
                          );
                        },
                        child: AutoSizeText(
                          'Make It Here',
                          style: TextStyle(
                            color: DefaultColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
