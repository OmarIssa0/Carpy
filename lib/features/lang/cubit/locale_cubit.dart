import 'package:bloc/bloc.dart';
import 'package:car_store/features/lang/widgets/language_cache_helper.dart';
import 'package:flutter/material.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCacheLanguageCode();

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
