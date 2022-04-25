import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reg_app/ui/enums/enum.dart';

import '../../constants/constant.dart';

class YourAddress extends StatefulWidget {
  static String id = 'youraddress';
  const YourAddress({Key? key}) : super(key: key);

  @override
  State<YourAddress> createState() => _YourAddressState();
}

class _YourAddressState extends State<YourAddress> {
  //Variable Declaration Section

  final _formKeyYourAddress = GlobalKey<FormState>();
  var _place;
  TextEditingController addressCont = TextEditingController();
  TextEditingController landmarkCont = TextEditingController();
  TextEditingController cityCont = TextEditingController();
  TextEditingController pinCont = TextEditingController();

  //Validating Field that require the same logic to validate it
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    } else if (value.length <= 3) {
      return 'Please enter the value more than 3 characters';
    } else {
      return null;
    }
  }

  //Validating City Name
  String? _validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    } else {
      return null;
    }
  }

  //Validating Pin Code
  String? _validatePinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    } else if (value.length != 6) {
      return 'Please enter a 6 digit Pin Code';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKeyYourAddress,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //Back Arrow for navigating to previous screen
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Expanded(
                      child: Text(
                        'Your Address',
                        textAlign: TextAlign.center,
                        style: KheaderStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //Enter the address
                TextFormField(
                  controller: addressCont,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                    hintText: 'Address',
                    hintStyle: KHintStyle,
                  ),
                  validator: (value) => _validateField(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Enter the Landmark
                TextFormField(
                  controller: landmarkCont,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                    hintText: 'Landmark',
                    hintStyle: KHintStyle,
                  ),
                  validator: (value) => _validateField(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Enter the City Name
                TextFormField(
                  controller: cityCont,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.home),
                    hintText: 'City',
                    hintStyle: KHintStyle,
                  ),
                  validator: (value) => _validateCity(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Dropdown Button for Selection of State
                InputDecorator(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  child: DropdownButtonFormField(
                    hint: const Text('Select your state'),
                    decoration: const InputDecoration(border: InputBorder.none),
                    isExpanded: true,
                    //value: _place,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: states.entries.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.value),
                        value: e.value,
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        _place = newVal;
                      });
                    },
                    validator: (value) => value == null ? 'Requried' : null,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Enter the pin Code, only numbers allowed
                TextFormField(
                  controller: pinCont,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Pin Code',
                    hintStyle: KHintStyle,
                    prefixIcon: Icon(Icons.home),
                  ),
                  validator: (value) => _validatePinCode(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Upon Form Validation submit the form
                ElevatedButton(
                  onPressed: () {
                    if (_formKeyYourAddress.currentState!.validate()) {
                      print('Form Validated');
                    }
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.maxFinite, 64),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
