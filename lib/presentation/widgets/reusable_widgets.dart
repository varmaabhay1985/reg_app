import 'package:flutter/material.dart';
import 'package:reg_app/presentation/resources/strings_manager.dart';
import 'package:reg_app/presentation/resources/values_manager.dart';

Widget getLabelText(BuildContext context, String text1) {
  return RichText(
    text: TextSpan(
      style: Theme.of(context).textTheme.bodyText1,
      children: [
        TextSpan(text: text1),
        WidgetSpan(
          child: Transform.translate(
            offset: const Offset(AppMisc.tt1, AppMisc.tt2),
            child: const Text(AppStrings.star),
          ),
        ),
      ],
    ),
  );
}
