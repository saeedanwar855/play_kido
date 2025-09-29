import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:play_kido/core/localization/language_bloc.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/core/theme/app_theme.dart';
import 'package:play_kido/features/charactor/presentation/state_management/character_cubit.dart';
import 'package:play_kido/features/home/presentation/screen/custom_nev_bar_screen.dart';
import 'package:play_kido/l10n/arb/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider<LanguageBloc>(
              create: (context) =>
                  LanguageBloc()..add(ChangeLanguage(const Locale('en'))), // Initialize Bloc
            ),
            BlocProvider(
              create: (context) => CharacterCubit(),
            ),
          ],
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                locale: state.locale,
                home: const CustomNevBarScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
