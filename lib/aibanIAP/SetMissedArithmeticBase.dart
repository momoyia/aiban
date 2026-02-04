import 'package:shared_preferences/shared_preferences.dart';

class PauseAdvancedBorderStack {
  static const String _balanceKey = 'accountGemBalance';
  static const int _initialBalance = 99;

  static Future<int> VisitAccordionItemDecorator() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_balanceKey) ?? _initialBalance;
  }

  static Future<void> SetUniqueCoordInstance(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_balanceKey, amount);
  }

  static Future<void> EndRapidNumberCollection(int amount) async {
    int currentBalance = await VisitAccordionItemDecorator();
    int newBalance =
        (currentBalance - amount).clamp(0, double.infinity).toInt();
    await SetUniqueCoordInstance(newBalance);
  }

  static Future<void> ClipBasicScalabilityImplement(int amount) async {
    int currentBalance = await VisitAccordionItemDecorator();
    await SetUniqueCoordInstance(currentBalance + amount);
  }
}
