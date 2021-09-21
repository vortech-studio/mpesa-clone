// [ This is an auto generated file ]

import 'package:flutter/material.dart';
import 'package:mpesa_clone/core/router_constants.dart';

import 'package:mpesa_clone/views/splash/splash_view.dart' as view0;
import 'package:mpesa_clone/views/login/login_view.dart' as view1;
import 'package:mpesa_clone/views/menu/menu_view.dart' as view2;
import 'package:mpesa_clone/views/menu/menu_view.dart' as view3;
import 'package:mpesa_clone/views/home/home_view.dart' as view4;
import 'package:mpesa_clone/views/transact/transact_view.dart' as view5;

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashViewRoute:
        return MaterialPageRoute(builder: (_) => view0.SplashView());
      case loginViewRoute:
        return MaterialPageRoute(builder: (_) => view1.LoginView());
      case menuViewRoute:
        return MaterialPageRoute(builder: (_) => view2.MenuView());
      case menuViewRoute0:
        return MaterialPageRoute(builder: (_) => view3.MenuView());
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => view4.HomeView());
      case transactViewRoute:
        return MaterialPageRoute(builder: (_) => view5.TransactView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}