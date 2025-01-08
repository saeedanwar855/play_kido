import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  ChangeLanguage(this.locale);
  final Locale locale;
}

// State
class LanguageState {
  LanguageState(this.locale);
  final Locale locale;
}

// Bloc
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(const Locale('en'))) {
    on<ChangeLanguage>((event, emit) => emit(LanguageState(event.locale)));
  }
}
