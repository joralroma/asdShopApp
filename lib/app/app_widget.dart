import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// i18n
import 'package:asdshop/app/i18n/asd_localization.dart';

// Binding
import 'app_binding.dart';

// I18n

// Routes
import 'navigation/routes.dart';

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: AppBinding(),
      getPages: routes,
      defaultTransition: Transition.cupertino,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es')
      ],
      localizationsDelegates: [
        AsdLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

}