import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../resource/constraints/height_width.dart';
import '../../resource/routes/routes_name.dart';
import '../../resource/theme/colors.dart';
import '../../view_model/controller/auth/signup_controller.dart';
import '../../view_model/controller/auth/auth_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  SignUpController signUpController = Get.put(SignUpController());
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;

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

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _confirmPassword(String? value) {
    if (value!.isEmpty) {
      return 'Confirm Password is required';
    }
    if (signUpController.passwordController.text !=
        signUpController.confirmPasswordController.text) {
      return 'Password must be same';
    }
    return null;
  }

  String? _checkName(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    TextTheme textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
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
              height: height * 0.049,
              child: Text(
                'Create Your Account',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: _checkName,
                      onTap: () {
                        signUpController.setNameFocus(true);
                      },
                      controller: signUpController.nameController,
                      decoration: InputDecoration(
                        prefixIcon: Obx(
                          () => Icon(
                            Icons.email_rounded,
                            color: signUpController.isNameFocused.value
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        labelText: 'Name',
                      ),
                    ),
                    addVerticalSpace(Get.height * 0.006),
                    TextFormField(
                      style: textTheme.bodySmall,
                      onTap: () {
                        signUpController.setEmailFocus(true);
                      },
                      controller: signUpController.emailController,
                      decoration: InputDecoration(
                        prefixIcon: Obx(
                          () => Icon(
                            Icons.email_rounded,
                            color: signUpController.isEmailFocused.value
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        labelText: 'Email',
                        errorText: _emailErrorText,
                      ),
                      validator: _validateEmail,
                      onChanged: (_) {
                        setState(() {
                          _passwordErrorText = null;
                        });
                      },
                    ),
                    addVerticalSpace(Get.height * 0.006),
                    Obx(
                      () => TextFormField(
                        style: textTheme.bodySmall,
                        controller: signUpController.passwordController,
                        obscureText: loginController.isPasswordVisible.value,
                        onTap: () {
                          signUpController.setPasswordFocus(true);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Obx(
                            () => Icon(
                              Icons.lock_rounded,
                              color: signUpController.isPasswordFocused.value
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          labelText: 'Password',
                          errorText: _passwordErrorText,
                          suffixIcon: InkWell(
                            onTap: () {
                              loginController.togglePasswordVisibility();
                            },
                            child: Icon(
                              loginController.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: signUpController.isPasswordFocused.value
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        enableSuggestions: false,
                        validator: _validatePassword,
                        onChanged: (_) {
                          setState(() {
                            _passwordErrorText = null;
                          });
                        },
                      ),
                    ),
                    addVerticalSpace(Get.height * 0.006),
                    Obx(
                      () => TextFormField(
                        style: textTheme.bodySmall,
                        controller: signUpController.confirmPasswordController,
                        obscureText: loginController.isPasswordVisible.value,
                        onTap: () {
                          signUpController.setConfirmPasswordFocus(true);
                        },
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          prefixIcon: Obx(
                            () => Icon(
                              Icons.lock_rounded,
                              color: signUpController
                                      .isConfirmPasswordFocused.value
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          labelText: 'Confirm Password',
                          errorText: _confirmPasswordErrorText,
                          suffixIcon: InkWell(
                            onTap: () {
                              loginController.togglePasswordVisibility();
                            },
                            child: Icon(
                              loginController.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: signUpController
                                      .isConfirmPasswordFocused.value
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        validator: _confirmPassword,
                        onChanged: (_) {
                          setState(() {
                            _confirmPasswordErrorText = null;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
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
            addVerticalSpace(height * 0.023),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20),
              height: height * 0.06,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  if (signupFormKey.currentState!.validate()) {
                    signUpController.signupApi();
                  }
                },
                child: const Text('Sign up'),
              ),
            ),
            addVerticalSpace(height * 0.042),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: const Divider(
                    color: borderTextFormField,
                    height: 34,
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
                    color: borderTextFormField,
                    height: 34,
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
                  child: Image.asset('assets/images/google.png'),
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
                    'Already have an account?',
                    style: textTheme.bodyMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.signinView);
                      },
                      child: Text(
                        'Sign in',
                        style: textTheme.bodySmall,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
