import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reg_app/presentation/resources/strings_manager.dart';

import '../homepage/homepage.dart';
import '../yourAddress/youraddress.dart';
import '../yourInfo/yourinfo.dart';

class Routes {
  static const String homePageRoute = "/";
  static const String yourAddressRoute = "/yourAddress";
  static const String yourInfoRoute = "/yourInfo";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.yourInfoRoute:
        return MaterialPageRoute(builder: (_) => YourInfo());
      case Routes.yourAddressRoute:
        return MaterialPageRoute(builder: (_) => YourAddress());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound),
        ),
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
