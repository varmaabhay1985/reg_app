import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reg_app/presentation/resources/color_manager.dart';
import 'package:reg_app/presentation/resources/routes_manager.dart';
import 'package:reg_app/presentation/resources/strings_manager.dart';
import 'package:reg_app/presentation/resources/values_manager.dart';
import 'package:reg_app/presentation/widgets/buttons.dart';
import 'package:reg_app/presentation/widgets/reusable_widgets.dart';

import '../../domain/enums/enum.dart';
import '../widgets/image_source_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable Declaration Section

  TextEditingController firstNameCont = TextEditingController();

  TextEditingController lastNameCont = TextEditingController();

  TextEditingController emailCont = TextEditingController();

  TextEditingController phoneCont = TextEditingController();

  TextEditingController pwdCont = TextEditingController();

  TextEditingController confirmPwdCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File? _imageFile;

  Gender gender = Gender.Male;

  bool isPasswordHidden = true;

  //Loading of Image

  void _getImage(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => ImageSourceSheet(
              onImageSelected: (image) {
                if (image != null) {
                  setState(() {
                    _imageFile = image;
                  });
                  // close modal
                  Navigator.of(context).pop();
                }
              },
            ));
  }

// Email validation using Email Validator Package
  String? _validateEmail(String? value) {
    bool isEmailValid = EmailValidator.validate(value!);

    if (value == null || value.isEmpty || !isEmailValid)
      return 'Enter a valid email address';
    else
      return null;
  }

//Name Validation
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length <= 3) {
      return 'Please enter a name more than three characters';
    } else {
      return null;
    }
  }

// Phone Number Validation
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a Phone Number';
    } else if (value.length != 10) {
      return 'Please enter a phone number of length 10 digits';
    } else {
      return null;
    }
  }

  //Validating Password

  String? _validatePassword(String? value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter a Password';
    } else if (value.length < 8) {
      return 'Password must be atleast 8 characters long';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }

  //Validating Confirm Password

  String? _validateConfirmPassword(String? value) {
    if (value != pwdCont.text.trim()) {
      return 'Passwords donot match';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          //autovalidateMode: AutovalidateMode.always, // AutoValidateMode on
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    AppStrings.register,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                // Image Upload with the help of Gesture Detector
                GestureDetector(
                  child: Center(
                      child: _imageFile == null
                          ? CircleAvatar(
                              radius: AppSize.s60,
                              backgroundColor: Colors.blueAccent,
                              child: Icon(Icons.camera_alt,
                                  size: AppSize.s28, color: ColorManager.white))
                          : CircleAvatar(
                              radius: AppSize.s60,
                              backgroundImage: FileImage(_imageFile!),
                            )),
                  onTap: () {
                    /// Get profile image
                    _getImage(context);
                  },
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                //All Field LAbels wrapped within RichText
                getLabelText(context, AppStrings.fName),
                // Input your First Name
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                  ],
                  keyboardType: TextInputType.name,
                  controller: firstNameCont,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _validateName(value),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                getLabelText(context, AppStrings.lName),

                //Input your LAst Name
                TextFormField(
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                  ],
                  controller: lastNameCont,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _validateName(value),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                getLabelText(context, AppStrings.pNum),
                //Input your 10 digit Phone Number
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  keyboardType: TextInputType.phone,
                  controller: phoneCont,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _validatePhone(value),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                getLabelText(context, AppStrings.email),
                // Input your Email
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCont,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _validateEmail(value),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                //Select your Gender
                getLabelText(context, AppStrings.gen),
                Row(
                  children: [
                    Radio(
                        value: Gender.Male,
                        groupValue: gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value!;
                          });
                        }),
                    Text(AppStrings.male,
                        style: Theme.of(context).textTheme.bodyText1),
                    const SizedBox(
                      width: AppSize.s12,
                    ),
                    Radio(
                        value: Gender.Female,
                        groupValue: gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value!;
                          });
                        }),
                    Text(AppStrings.female,
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),

                getLabelText(context, AppStrings.pwd),

                //Input your Password with visibiltiy on and off
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: pwdCont,
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    border: const OutlineInputBorder(),
                    suffix: IconButton(
                      icon: isPasswordHidden
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                  ),
                  validator: (value) => _validatePassword(value),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),

                getLabelText(context, AppStrings.cPwd),
                //Enter the same password to confirm
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: confirmPwdCont,
                  obscureText: isPasswordHidden,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    border: const OutlineInputBorder(),
                    suffix: IconButton(
                      icon: isPasswordHidden
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                    ),
                  ),
                  validator: (value) => _validateConfirmPassword(value),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                //Submit of the form, if form validatio is done
                ElevatedButtons(
                  text: AppStrings.next,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, Routes.yourInfoRoute);
                    }
                  },
                  s: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
