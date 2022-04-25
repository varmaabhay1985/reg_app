import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reg_app/constants/constant.dart';
import 'package:reg_app/ui/enums/enum.dart';
import 'package:reg_app/ui/views/youraddress.dart';

class YourInfo extends StatefulWidget {
  static String id = 'yourinfo';
  const YourInfo({Key? key}) : super(key: key);

  @override
  State<YourInfo> createState() => _YourInfoState();
}

class _YourInfoState extends State<YourInfo> {
  //Variable Declaration Section

  var _education = Edu[Education.PG];
  final _formKeyYourInfo = GlobalKey<FormState>();
  TextEditingController gradeCont = TextEditingController();
  TextEditingController yopCont = TextEditingController();
  TextEditingController expCont = TextEditingController();
  TextEditingController desgCont = TextEditingController();
  TextEditingController domCont = TextEditingController();

  // Validate Field which require same validation
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
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
          key: _formKeyYourInfo,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Back Arrow for going to previous Screen
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    const Expanded(
                      child: Text(
                        'Your Info',
                        textAlign: TextAlign.center,
                        style: KheaderStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Educational Info', style: KSubHeaderStyle),
                const SizedBox(
                  height: 10,
                ),
                // All labels wrapped in Rich Text
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Education'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Wrapping DropDown With Input Decorator to give it a Rectangular Border while removing
                // of underline
                InputDecorator(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        isExpanded: true,
                        value: _education,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: Edu.entries.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.value),
                            value: e.value,
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _education = newVal;
                          });
                        }),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Year of Passing'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Input year of passing only numbers allowed
                TextFormField(
                  controller: yopCont,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) => _validateField(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Grade'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
                //Enter your Grade only characters allowed
                TextFormField(
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                  ],
                  controller: gradeCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => _validateField(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Professional Info', style: KSubHeaderStyle),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Experience'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Enter your Experience only numbers allowed
                TextFormField(
                  controller: expCont,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) => _validateField(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Designation'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
                //Enter your designation only characters and numbers allowed
                TextFormField(
                  controller: desgCont,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))
                  ],
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) => _validateField(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Kstyle,
                    children: [
                      const TextSpan(text: 'Domain'),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(0.0, -7.0),
                          child: const Text('*'),
                        ),
                      ),
                    ],
                  ),
                ),
                //Enter your Domain, onlyc charactersa and number allowed
                TextFormField(
                  controller: domCont,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))
                  ],
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) => _validateField(value),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Buttons for navigation arranged in a row
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Goto Previous Page
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Previous', style: Kstyle),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size.fromHeight(64),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    //If form validation successful goto next page
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKeyYourInfo.currentState!.validate()) {
                            Navigator.pushNamed(context, YourAddress.id);
                          }
                        },
                        child: const Text('Next', style: Kstyle),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size.fromHeight(64),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blueAccent),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
