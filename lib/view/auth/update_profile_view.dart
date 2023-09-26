import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gokyo/resource/constraints/height_width.dart';
import 'package:gokyo/resource/theme/colors.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  File? _imageFile;
  GlobalKey formKey = GlobalKey();

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text('Fill Your Profile'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(height * .02),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (_imageFile == null)
                      Container(
                        padding: const EdgeInsets.only(
                          top: 40,
                          right: 20,
                          left: 20,
                        ),
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: photoBackground,
                        ),
                        child: const ClipOval(
                          child: SizedBox(
                            width: 130,
                            height: 130,
                            child: Icon(
                              Icons.person_2_rounded,
                              size: 130,
                              color: iconColor,
                            ),
                          ),
                        ),
                      )
                    else
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(_imageFile!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: blackColor,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.pen,
                            color: whiteColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
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
