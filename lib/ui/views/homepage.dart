import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reg_app/constants/constant.dart';

import '../enums/enum.dart';
import '../widgets/image_source_sheet.dart';
import 'yourinfo.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';
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
          autovalidateMode: AutovalidateMode.always, // AutoValidateMode on
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Register',
                    style: KheaderStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Image Upload with the help of Gesture Detector
                GestureDetector(
                  child: Center(
                      child: _imageFile == null
                          ? const CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.blueAccent,
                              child: Icon(Icons.camera_alt,
                                  size: 25, color: Colors.white))
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(_imageFile!),
                            )),
                  onTap: () {
                    /// Get profile image
                    _getImage(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                //All Field LAbels wrapped within RichText
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'First Name'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Last Name'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),

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
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Phone Number'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Email'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  height: 20,
                ),
                //Select your Gender
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Gender'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    const Text('Male', style: Kstyle),
                    const SizedBox(
                      width: 10,
                    ),
                    Radio(
                        value: Gender.Female,
                        groupValue: gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            gender = value!;
                          });
                        }),
                    const Text('Female', style: Kstyle),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Password'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),

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
                  height: 20,
                ),

                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Confirm Password'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
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
                  height: 20,
                ),
                //Submit of the form, if form validatio is done
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, YourInfo.id);
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.maxFinite, 64),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
