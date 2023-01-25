import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proses/source/pages/Auth/login.dart';
import 'package:proses/source/pages/Auth/splashScreen.dart';
import 'package:proses/source/pages/Home/detail.dart';
import 'package:proses/source/router/string.dart';

class RouterNavigation {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (context) => Login());
      case DETAIL:
        return MaterialPageRoute(builder: (context) => Detail());
      default:
        return null;
    }
  }
}
