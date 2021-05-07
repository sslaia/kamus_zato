import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kamuszato/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: KamusZato(),
      supportedLocales: [
        Locale('en'),
        Locale('id'),
      ],
      fallbackLocale: Locale('en'),
      path: 'assets/translations'));
}

class KamusZato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(),
    );
  }
}
