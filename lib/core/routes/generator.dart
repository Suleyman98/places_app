

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter/pages/home.dart';
import 'package:new_flutter/pages/home_detail.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map<String, dynamic Function(dynamic)> routes = {
      '/': (id) => route(const HomePage(),
          arguments: id as String, defaultAnimation: false, fromRtl: true,),
      '/detail': (id) {
        
        return route( const HomeDetail(), defaultAnimation: true, fromRtl: false,arguments: id);
      }
    };

    final dynamic Function(dynamic args)? pageBuilder = routes[settings.name];
    if (pageBuilder != null) {
      return pageBuilder(settings.arguments);
    } else {
      return CupertinoPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text("404"),
          ),
        );
      });
    }
  }

  static dynamic route(Widget widget,
      {dynamic arguments, bool fromRtl = false, bool defaultAnimation = true}) {
    if (defaultAnimation) {
      return MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          settings: RouteSettings(arguments: arguments));
    } else {
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.linear;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              textDirection: fromRtl ? TextDirection.rtl : TextDirection.ltr,
              position: animation.drive(tween),
              child: child,
            );
          },
          settings: RouteSettings(arguments: arguments),
          reverseTransitionDuration: const Duration(milliseconds: 300));
    }
  }
}
