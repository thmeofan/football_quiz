import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class ApiRepository {
  final String apiToken = '50d56084aec94a97a5bd24007f935234';

  Future<List<dynamic>> fetchTodayMatches() async {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final response = await http.get(
      Uri.parse(
          'http://api.football-data.org/v4/matches?dateFrom=$today&dateTo=$today'),
      headers: {'X-Auth-Token': apiToken},
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['matches'] ?? [];
    } else {
      throw Exception(
          'Failed to load today\'s matches. Try enter the screen again');
    }
  }

  Future<List<dynamic>> fetchMatches() async {
    final response = await http.get(
      Uri.parse('http://api.football-data.org/v4/matches'),
      headers: {'X-Auth-Token': apiToken},
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return result['matches'] ?? [];
    } else {
      throw Exception('Failed to load matches. Try enter the screen again');
    }
  }
}
