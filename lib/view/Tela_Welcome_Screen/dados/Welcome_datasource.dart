import 'package:shared_preferences/shared_preferences.dart';

const String kDontShowAgainkey = 'dontShowAgain';

class WelcomeDataSource {
  final SharedPreferences sharedPreferences;

  WelcomeDataSource({required this.sharedPreferences});

  registerDontShowAgain({required bool value}) async {
   await sharedPreferences.setBool(kDontShowAgainkey, value);
  }

  bool getDontShowAgain() {
    return sharedPreferences.getBool(kDontShowAgainkey) ?? false;
  }
}