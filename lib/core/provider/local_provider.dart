import 'dart:developer';

import 'package:flutter/material.dart';

class LocalProvider with ChangeNotifier {
  Locale _myLocale = const Locale('eng');

  Locale get myLocale {
    return _myLocale;
  }

  void changeLocale(Locale locale) {
    _myLocale = locale;
    log(locale.languageCode);
    notifyListeners();
  }
}
