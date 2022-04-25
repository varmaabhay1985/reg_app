import 'package:flutter/material.dart';

import 'ui/views/homepage.dart';
import 'ui/views/youraddress.dart';
import 'ui/views/yourinfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        YourInfo.id: (context) => YourInfo(),
        YourAddress.id: (context) => YourAddress(),
      },
    );
  }
}
