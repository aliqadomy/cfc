import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String ARABIC = 'ar';


Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? ENGLISH;
  print("languageCode ${languageCode}");
  return _locale(languageCode);
}




Locale _locale(String languageCode)
{
  switch(languageCode){
    case ENGLISH:
      return Locale(ENGLISH);
    case ARABIC:
      return Locale(ARABIC);
    default:
      return Locale('ENGLISH');

  }
}
