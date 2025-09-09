import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalProvider extends ChangeNotifier {
  Future<void> saveLanguageShredPref(String languageCode) async {
    final prefl = await SharedPreferences.getInstance();
    await prefl.setString("language_code", languageCode);
  }

  Future<Locale?> getLanguageCode() async {
    final prefl = await SharedPreferences.getInstance();
    final languageCode = prefl.getString('languageCode');
    if (languageCode != null) {
      return Locale(languageCode);
    } else {
      return Locale("", "");
    }
  }
}
