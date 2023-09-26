// ignore_for_file: unused_field

import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gokyo/resource/theme/colors.dart';
import 'package:get/get.dart';
import 'package:gokyo/view_model/controller/auth/signin_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../resource/constraints/height_width.dart';
import '../../resource/routes/routes_name.dart';
import '../../resource/utils/utils.dart';
import '../../view_model/controller/auth/auth_controller.dart';

// ignore: must_be_immutable
class SigninView extends StatefulWidget {
  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String? _emailErrorText;

  String? _passwordErrorText;

  void _signin() async {
    if (_formKey.currentState!.validate()) {
      print('You want to login');
      try {
        String url = 'https://ea.allgetz.com/api/v1/site/loginUser';

        var body = {
          'email': emailController.text.trim(),
          'password': passwordController.text,
        };

        var response = await http.post(Uri.parse(url), body: body);

        if (response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          if (jsonResponse['success']) {
            Utils.snackBar('Login', 'Login successfully');
            Get.toNamed(RouteName.homeView);
          } else {
            String errorMessage = jsonResponse['message'] ?? 'Signin failed';
            Utils.toastMessage(errorMessage);
          }
        } else {
          Utils.toastMessage('Signin failed');
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final SignInController signInController = Get.put(SignInController());

    TextTheme textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .08,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(
                height: height * 0.053,
                child: Text(
                  'Login to Your Account',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
              ),
              addVerticalSpace(Get.height * 0.026),
              Container(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: signInController.emailController,
                        validator: _validateEmail,
                        enableSuggestions: false,
                        onTap: () {
                          signInController.setEmailFocus(true);
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Obx(
                            () => Icon(
                              Icons.email_rounded,
                              color: signInController.isEmailFocused.value
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          hintText: 'Enter your email',
                        ),
                        onChanged: (_) {
                          setState(() {
                            _emailErrorText = null;
                          });
                        },
                      ),
                      addVerticalSpace(Get.height * 0.006),
                      Obx(
                        () => TextFormField(
                          controller: signInController.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          onTap: () {
                            signInController.setPasswordFocus(true);
                          },
                          obscureText: loginController.isPasswordVisible.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Obx(
                              () => Icon(
                                Icons.lock_rounded,
                                color: signInController.isPasswordFocused.value
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                loginController.togglePasswordVisibility();
                              },
                              child: Icon(
                                loginController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: signInController.isPasswordFocused.value
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          onChanged: (_) {
                            setState(() {
                              _passwordErrorText = null;
                            });
                          },
                          style: textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              addVerticalSpace(Get.height * 0.036),
              SizedBox(
                height: height * 0.05,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: loginController.rememberMe.value,
                        onChanged: loginController.toggleRememberMe,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        checkColor: Colors.white,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Text(
                      'Remember Me',
                      style: textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              addVerticalSpace(height * 0.02),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                height: height * 0.06,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    signInController.signinApi();
                  },
                  child: const Text('Sign in'),
                ),
              ),
              addVerticalSpace(height * 0.02),
              SizedBox(
                height: height * 0.05,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot the password?',
                    style: textTheme.displaySmall,
                  ),
                ),
              ),
              addVerticalSpace(height * 0.02),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: const Divider(
                      color: blackColor,
                      height: 36,
                    ),
                  ),
                ),
                Text(
                  "or continue with",
                  style: textTheme.bodyLarge,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      color: blackColor,
                      height: 36,
                    ),
                  ),
                ),
              ]),
              addVerticalSpace(height * 0.035),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: borderTextFormField,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.facebook_rounded,
                      color: blueColor,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderTextFormField),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/images/google.png'),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderTextFormField),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.linkedin,
                      color: blueColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.11,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.signupView);
                      },
                      child: Text(
                        'Sign up',
                        style: textTheme.bodySmall,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
