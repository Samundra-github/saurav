import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gokyo/resource/components/brand_icon.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/theme/colors.dart';

import '../../resource/routes/routes_name.dart';

class GetinView extends StatelessWidget {
  const GetinView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addVerticalSpace(height * 0.01),
              Container(
                height: height * .23,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/getin.png'),
                  ),
                ),
              ),
              addVerticalSpace(height * 0.02),
              SizedBox(
                height: height * 0.08,
                child: Text(
                  'Let\'s you in',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
              ),
              addVerticalSpace(height * 0.02),
              Column(
                children: [
                  Container(
                    height: height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderTextFormField),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const BrandButton(
                      brandIcon: Icon(
                        Icons.facebook_rounded,
                        color: blueColor,
                      ),
                      label: 'Continue with Facebook',
                    ),
                  ),
                  addVerticalSpace(12),
                  Container(
                    height: height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderTextFormField),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BrandButton(
                      brandIcon: Image.asset(
                        'assets/images/google.png',
                        height: 30,
                        width: 30,
                      ),
                      label: 'Continue with Google',
                    ),
                  ),
                  addVerticalSpace(12),
                  Container(
                    height: height * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderTextFormField),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const BrandButton(
                      brandIcon: Icon(
                        FontAwesomeIcons.linkedin,
                        color: blueColor,
                      ),
                      label: 'Continue with Linkedin',
                    ),
                  ),
                ],
              ),
              addVerticalSpace(height * 0.04),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 10.0),
                      child: const Divider(
                        color: borderTextFormField,
                        height: 36,
                      )),
                ),
                Text(
                  "or",
                  style: textTheme.bodyLarge,
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 30.0),
                      child: const Divider(
                        color: borderTextFormField,
                        height: 36,
                      )),
                ),
              ]),
              addVerticalSpace(height * 0.03),
              SizedBox(
                height: height * 0.06,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteName.signinView);
                  },
                  child: const Text('Sign in with password'),
                ),
              ),
              SizedBox(
                height: height * 0.1,
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
