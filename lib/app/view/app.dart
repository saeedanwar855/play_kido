import 'package:flutter/material.dart';
import 'package:play_kido/core/theme/app_theme.dart';
import 'package:play_kido/features/home/screen/custom_nev_bar_screen.dart';
import 'package:play_kido/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CustomNevBarScreen(),
    );
  }
}
