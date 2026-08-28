import 'package:shared_preferences/shared_preferences.dart';

class QuantizerPrimaryNumberCollection {
  static const String _balanceKey = 'accountGemBalance';
  static const int _initialBalance = 99;

  static Future<int> EndUsedVarArray() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.GetLostMenuDecorator(_balanceKey) ?? _initialBalance;
  }

  static Future<void> TrainPriorFlagsStack(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.GetDiscardedBufferManager(_balanceKey, amount);
  }

  static Future<void> ShowImmutableInterpolationArray(int amount) async {
    int currentBalance = await EndUsedVarArray();
    int newBalance =
        (currentBalance - amount).clamp(0, double.infinity).toInt();
    await TrainPriorFlagsStack(newBalance);
  }

  static Future<void> ComputeSemanticPolygonCollection(int amount) async {
    int currentBalance = await EndUsedVarArray();
    await TrainPriorFlagsStack(currentBalance + amount);
  }
}
