import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontend/app/widget/authfield.dart';
import 'package:frontend/app/widget/buttonApp.dart';
import 'package:frontend/constant/constant.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController limitController = TextEditingController();
    Get.lazyPut(() => SignupController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Left side with blue background (moved to first position)
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFF1A73E8), // Blue color
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/lastlogo-bg.png",
                      width: 120,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Welcome to Money Mate",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Your personal finance manager to help you track expenses and reach your financial goals.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right side with signup form
          Expanded(
            flex: 1,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ), // Reduced max width from 450 to 380
                  // padding: const EdgeInsets.symmetric(
                  //   horizontal: 2,
                  // ), // Reduced padding from 40 to 30
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start, // Keep content as compact as possible
                    children: [
                      Image.asset(
                        "assets/images/lastlogo-bg.png",
                        width: 50,
                      ), // Reduced size from 60 to 50
                      Gap.h8, // Reduced from h12
                      Text(
                        'Hello Momates!',
                        style: TypographyApp.headline1.copyWith(
                          fontSize: 28,
                        ), // Reduced font size from 32 to 28
                      ),
                      Gap.h4, // Reduced from h8
                      Text(
                        'Sign-Up to your account',
                        style: TypographyApp.text1.copyWith(
                          fontSize: 14,
                        ), // Added smaller font size
                      ),
                      Gap.h16, // Reduced from h24
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              // width: ,
                              // height: 50,
                              // color: Colors.red,
                              // child: Text("data"),
                              child: Column(
                                children: [
                                  AuthTextField(
                                    title: "Fullname",
                                    controller: nameController,
                                  ),
                                  Gap.h8, // Reduced from h12
                                  AuthTextField(
                                    title: "Email",
                                    controller: emailController,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap.w16,
                          Expanded(
                            child: Column(
                              children: [
                                AuthTextField(
                                  title: "Password",
                                  controller: passwordController,
                                  isObsecure: true,
                                ),
                                Gap.h8, // Reduced from h12
                                AuthTextField(
                                  title: "Spent Limit",
                                  controller: limitController,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap.h16, // Reduced from h24

                      Gap.h12,
                      ButtonApp(
                        action: "Sign-Up",
                        onTap: () async {
                          await controller.signup(
                            fullname: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            limit: int.tryParse(limitController.text) ?? 0,
                          );
                        },
                      ),
                      Gap.h8, // Reduced from h12
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have an account?',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/signin');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ), // Reduced padding
                            ),
                            child: Text(
                              'Sign In',
                              style: TypographyApp.text1.copyWith(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom compact auth field

  // Custom compact spent limit field
}
