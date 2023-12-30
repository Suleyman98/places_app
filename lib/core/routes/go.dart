
import 'package:flutter/material.dart';

class GO {
  static final key = GlobalKey<NavigatorState>();
  static BuildContext context = key.currentState!.context;
  static args(BuildContext context) =>
      ModalRoute.of(context)?.settings.arguments;
  static to(String routeName, {dynamic arguments}) async {
    return await key.currentState?.pushNamed(
      routeName,
      arguments: arguments,
      
    );
  }

  static toAndReplace(String routeName, {dynamic arguments}) async {
    return await key.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static toAndReplacePrevious(String routeName, {dynamic arguments}) async {
    return await key.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static back() {
    return key.currentState?.pop();
  }
}
