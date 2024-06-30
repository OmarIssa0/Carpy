import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  // تخزين قيمة الي بحفظها المستخدم
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
  }

  // بترجع اللغة الي ختارها المستخدم
  Future<String> getCacheLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString('LOCALE');
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "ar";
    }
  }
}
