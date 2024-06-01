import 'package:doctor_app/Login/onbording.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/widgets/languge_manger.dart';
import 'package:doctor_app/widgets/theme_manger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyA8bCl1odeUw3ZkJADHPgUxent161-wEYg',
          appId: '1:685681991296:android:df6fe03bacfe041bbc5065',
          messagingSenderId: '685681991296	',
          projectId: 'dermatology-7fea3'));
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (context, themeManager, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My App',
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LanguageManager.supportedLocales,
            locale: LanguageManager.appLocale,
            theme: ThemeData.light(), // ثيم الضوء
            darkTheme: ThemeData.dark(), // ثيم الظلام
            themeMode: themeManager.themeMode, // استخدام الثيم من ThemeManager
            home: OnBoardingView(),
          );
        },
      ),
    );
  }
}
bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
