import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_flutter/core/provider/local_provider.dart';
import 'package:new_flutter/core/routes/generator.dart';
import 'package:new_flutter/core/routes/go.dart';
import 'package:new_flutter/l10n/l10n.dart';
import 'package:new_flutter/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:new_flutter/pages/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return LocalProvider();
      },
      builder: (context, _) {
        final provider = context.watch<LocalProvider>();
        return MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: GO.key,
          supportedLocales: L10n.all,
          locale: provider.myLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          debugShowCheckedModeBanner: false,
          home: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://st2.depositphotos.com/50790684/47731/v/450/depositphotos_477316082-stock-illustration-super-mario-blackground-vector-image.jpg',
                    ),
                    fit: BoxFit.fitHeight)),
            child: const HomePage(),
          ),
        );
      },
    );
  }
}



