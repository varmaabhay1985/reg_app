import 'package:flutter/material.dart';
import 'package:reg_app/presentation/resources/color_manager.dart';

class ElevatedButtons extends StatelessWidget {
  ElevatedButtons({this.text, this.onPressed, this.s});

  final String? text;
  final VoidCallback? onPressed;
  final int? s;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text!, style: Theme.of(context).textTheme.bodyText1),
      style: s == 0 ? getElevatedButtonStyle1() : getElevatedButtonStyle(),
    );
  }

  ButtonStyle getElevatedButtonStyle() {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size.fromHeight(64),
      ),
      backgroundColor: MaterialStateProperty.all(ColorManager.primary),
    );
  }

  ButtonStyle getElevatedButtonStyle1() {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 64),
      ),
      backgroundColor: MaterialStateProperty.all(ColorManager.primary),
    );
  }
}

class OutlinedButtons extends StatelessWidget {
  OutlinedButtons({this.text, this.onPressed, this.s});

  final String? text;
  final VoidCallback? onPressed;
  final int? s;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text!, style: Theme.of(context).textTheme.bodyText1),
      style: s == 0 ? getOutlinedButtonStyle() : getOutlinedButtonStyle1(),
    );
  }

  ButtonStyle getOutlinedButtonStyle() {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size.fromHeight(64),
      ),
    );
  }

  ButtonStyle getOutlinedButtonStyle1() {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.all(
        const Size(double.maxFinite, 64),
      ),
    );
  }
}
