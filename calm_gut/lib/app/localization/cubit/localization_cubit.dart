import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState(locale: Locale('en')));

  void onToggleEnglish() {
    emit(LocalizationState(locale: Locale('en')));
  }

  void onToggleRussian() {
    emit(LocalizationState(locale: Locale('ru')));
  }

  void onToggleKazakh() {
    emit(LocalizationState(locale: Locale('kk')));
  }

  void onToggleLocale(Locale locale) {
    print("onToggleLocale called");
    emit(LocalizationState(locale: locale));
  }
}
