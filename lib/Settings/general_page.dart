import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/widgets/theme_manger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // استيراد Provider

import 'package:doctor_app/widgets/languge_manger.dart'; // استيراد LanguageManager

class GeneralPage extends StatefulWidget {
  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  Locale _currentLocale = Locale('en'); // اللغة الافتراضية هي الإنجليزية

  @override
  void initState() {
    super.initState();
    _currentLocale = LanguageManager
        .appLocale; // تحديد اللغة الحالية للتطبيق عند بدء التشغيل
  }

  @override
  Widget build(BuildContext context) {
    ThemeManager themeManager =
        Provider.of<ThemeManager>(context); // الحصول على ThemeManager

    return Scaffold(
      appBar: AppBar(
        title: Text('General Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton<Locale>(
              value: _currentLocale,
              items: LanguageManager.supportedLocales.map((locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child:
                      Text(locale.languageCode == 'en' ? 'English' : 'العربية'),
                );
              }).toList(),
              onChanged: (newLocale) {
                _changeLanguage(context, newLocale!);
              },
            ),
          ),
          ListTile(
            title: Text('Theme'),
            trailing: DropdownButton<ThemeMode>(
              value: themeManager.themeMode,
              items: [
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Default'),
                ),
              ],
              onChanged: (newThemeMode) {
                themeManager.changeTheme(newThemeMode!);
              },
            ),
          ),
          // ... other settings
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, Locale newLocale) {
    final currentLocale = Localizations.localeOf(context);

    setState(() {
      _currentLocale = newLocale;
      if (currentLocale == newLocale) {
        _currentLocale = newLocale;
      }
    });

    LanguageManager.changeLocale(context, newLocale); // تحديث لغة التطبيق
  }
}
