import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/consts/app_text_styles/calendar_text_style.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../../../consts/app_colors.dart';
import '../widgets/date_row_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<dynamic> matches = [];
  final String apiToken = '50d56084aec94a97a5bd24007f935234';
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchTodayMatches();
  }

  void fetchTodayMatches() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    try {
      final response = await http.get(
        Uri.parse(
            'http://api.football-data.org/v4/matches?dateFrom=$today&dateTo=$today'),
        headers: {'X-Auth-Token': apiToken},
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['matches'].isEmpty) {
          fetchMatches();
        } else {
          setState(() {
            matches = result['matches'];
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Failed to load today\'s matches';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void fetchMatches() async {
    try {
      final response = await http.get(
        Uri.parse('http://api.football-data.org/v4/matches'),
        headers: {'X-Auth-Token': apiToken},
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        setState(() {
          matches = result['matches'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load matches';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return Center(child: Text(_errorMessage));
    }

    if (matches.isEmpty) {
      return Center(child: Text('No matches for today'));
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Match Calendar'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.blueColor,
              AppColors.blackColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.1,
              ),
              child: DateRowWidget(),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  final match = matches[index];

                  final country = match['area']['name'];
                  final String svgFileName =
                      match['area']['name'].toString().toLowerCase();
                  final competitionName = match['competition']['name'];
                  final matchRound = match['matchday'] != null
                      ? "Round ${match['matchday']}"
                      : "TBD";

                  final dateTime = DateTime.parse(match['utcDate']).toLocal();
                  final formattedTime = DateFormat('HH:mm').format(dateTime);

                  final homeScore = match['score']['fullTime']['home'];
                  final awayScore = match['score']['fullTime']['away'];
                  final scoreDisplay = homeScore != null && awayScore != null
                      ? "$homeScore - $awayScore"
                      : "-";

                  final matchStatus = match['status'];
                  String displayStatus;
                  switch (matchStatus) {
                    case 'SCHEDULED':
                      displayStatus = 'Not Started';
                      break;
                    case 'LIVE':
                      displayStatus = 'Live';
                      break;
                    case 'IN_PLAY':
                      displayStatus = 'In Play';
                      break;
                    case 'PAUSED':
                      displayStatus = 'Paused';
                      break;
                    case 'FINISHED':
                      displayStatus = 'Finished';
                      break;
                    case 'POSTPONED':
                      displayStatus = 'Postponed';
                      break;
                    case 'SUSPENDED':
                      displayStatus = 'Suspended';
                      break;
                    case 'CANCELED':
                      displayStatus = 'Canceled';
                      break;
                    default:
                      displayStatus = 'Unknown';
                      break;
                  }
                  return Column(
                    children: [
                      Container(
                        height: size.height * 0.05,
                        color: AppColors.whiteColor.withOpacity(0.05),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            SvgPicture.asset(
                              'assets/flags/$svgFileName.svg',
                              width: 30,
                              height: 20,
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                padding: const EdgeInsets.all(5.0),
                                child: const CircularProgressIndicator(),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              "$country - $competitionName. $matchRound",
                              style: CalendarTextStyle.title,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 0.025,
                        child: Row(children: [
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            '$formattedTime',
                            style: CalendarTextStyle.time,
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            '${match['homeTeam']['name']} vs ${match['awayTeam']['name']} ',
                            style: CalendarTextStyle.subtitle,
                          ),
                          Spacer(),
                          Text(
                            '$scoreDisplay ',
                            style: CalendarTextStyle.score,
                          ),
                          Spacer(),
                          Text(
                            '$displayStatus',
                            style: CalendarTextStyle.subtitle,
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                        ]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
