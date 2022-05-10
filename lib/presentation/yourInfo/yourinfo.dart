import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reg_app/presentation/resources/routes_manager.dart';
import 'package:reg_app/presentation/resources/strings_manager.dart';
import 'package:reg_app/presentation/resources/values_manager.dart';
import 'package:reg_app/presentation/widgets/buttons.dart';
import 'package:reg_app/presentation/widgets/reusable_widgets.dart';

import '../../domain/enums/enum.dart';

class YourInfo extends StatefulWidget {
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
                    Expanded(
                      child: Text(
                        AppStrings.yInfo,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s20),
                Text(AppStrings.eInfo,
                    style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(
                  height: AppSize.s12,
                ),
                // All labels wrapped in Rich Text
                getLabelText(context, AppStrings.education),
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
                  height: AppSize.s12,
                ),
                getLabelText(context, AppStrings.yop),
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
                  height: AppSize.s20,
                ),
                getLabelText(context, AppStrings.grade),
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
                  height: AppSize.s20,
                ),
                Text(AppStrings.pInfo,
                    style: Theme.of(context).textTheme.subtitle1),
                const SizedBox(
                  height: AppSize.s12,
                ),
                getLabelText(context, AppStrings.exp),
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
                  height: AppSize.s20,
                ),
                getLabelText(context, AppStrings.desgn),
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
                  height: AppSize.s20,
                ),
                getLabelText(context, AppStrings.domain),
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
                  height: AppSize.s20,
                ),
                // Buttons for navigation arranged in a row
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Goto Previous Page
                    Expanded(
                      child: OutlinedButtons(
                          text: AppStrings.prev,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          s: 1),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    //If form validation successful goto next page
                    Expanded(
                      child: ElevatedButtons(
                          text: AppStrings.next,
                          onPressed: () {
                            if (_formKeyYourInfo.currentState!.validate()) {
                              Navigator.pushReplacementNamed(
                                  context, Routes.yourAddressRoute);
                            }
                          },
                          s: 1),
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
