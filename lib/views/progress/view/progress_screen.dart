import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;
import '../../../consts/app_colors.dart';

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
    final categories = ['Rules', 'Teams', 'Players', 'Club history'];

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
    Size size = MediaQuery.of(context).size;
    List<Widget> scoreContainers = categoryScores.entries.map((entry) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Progress'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover, // Cover the entire screen area
            colorFilter: ColorFilter.mode(
              Colors.transparent.withOpacity(1),
              BlendMode.dstATop, // Darken the background image
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your Results',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.1),
                  child: Container(
                    height: size.width * 0.7,
                    //  width: size.width * 0.7,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(color: AppColors.whiteColor),
                      // borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: scoreContainers,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
