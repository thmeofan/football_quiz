import 'package:shared_preferences/shared_preferences.dart';

class ProgressManager {
  final SharedPreferences prefs;

  ProgressManager(this.prefs);

  Future<void> saveCategoryScore(String category, int score) async {
    int currentScore = prefs.getInt(category) ?? 0;
    await prefs.setInt(category, currentScore + score);
  }

  int getCategoryScore(String category) {
    return prefs.getInt(category) ?? 0;
  }
}

Future<void> onQuizCompleted(String category, int score) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final progressManager = ProgressManager(prefs);

  await progressManager.saveCategoryScore(category, score);
}
