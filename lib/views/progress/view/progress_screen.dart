import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  // This map will hold the scores for each category
  Map<String, int> categoryScores = {};

  @override
  void initState() {
    super.initState();
    loadScores();
  }

  // Load scores from SharedPreferences
  Future<void> loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    // Assuming you have a set list of categories
    final categories = ['rules', 'teams', 'players', 'club history'];

    // Populate the categoryScores map
    Map<String, int> scores = {};
    for (String category in categories) {
      scores[category] = prefs.getInt(category) ?? 0;
    }

    // Update the state with the new scores
    setState(() {
      categoryScores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a list of category score containers
    List<Widget> scoreContainers = categoryScores.entries.map((entry) {
      return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(entry.key, style: TextStyle(color: Colors.white)),
            Text('${entry.value}', style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Your Results',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ...scoreContainers, // Spread the list of containers into the column
        ],
      ),
    );
  }
}
