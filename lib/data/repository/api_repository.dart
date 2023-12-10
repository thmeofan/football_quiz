// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;
//
// class ApiRepository {
//   void fetchMatches() async {
//     // Similar to fetchTodayMatches, but fetch all matches.
//     try {
//       final response = await http.get(
//         Uri.parse('http://api.football-data.org/v4/matches'),
//         headers: {'X-Auth-Token': apiToken},
//       );
//
//       if (response.statusCode == 200) {
//         final result = json.decode(response.body);
//         setState(() {
//           matches = result['matches'];
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _errorMessage = 'Failed to load matches';
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _errorMessage = e.toString();
//         _isLoading = false;
//       });
//     }
//   }
// }
