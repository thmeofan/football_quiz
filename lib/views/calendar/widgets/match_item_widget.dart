import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:football_quiz/consts/app_text_styles/calendar_text_style.dart';
import '../../../consts/app_colors.dart';

class MatchItemWidget extends StatelessWidget {
  final dynamic match;
  final Size size;

  const MatchItemWidget({
    super.key,
    required this.match,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final country = match['area']['name'];
    final String svgFileName = match['area']['name'].toString().toLowerCase();
    final competitionName = match['competition']['name'];
    final matchRound =
        match['matchday'] != null ? "Round ${match['matchday']}" : "TBD";

    final dateTime = DateTime.parse(match['utcDate']).toLocal();
    final formattedTime = DateFormat('HH:mm').format(dateTime);

    final homeScore = match['score']['fullTime']['home'];
    final awayScore = match['score']['fullTime']['away'];
    final scoreDisplay = homeScore != null && awayScore != null
        ? "$homeScore - $awayScore"
        : "-";

    final matchStatus = match['status'];
    String displayStatus = _getDisplayStatus(matchStatus);

    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          color: AppColors.whiteColor.withOpacity(0.05),
          child: Row(
            children: [
              SizedBox(width: size.width * 0.02),
              SvgPicture.asset(
                'assets/flags/$svgFileName.svg',
                width: 30,
                height: 20,
                placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(5.0),
                  child: const CircularProgressIndicator(),
                ),
              ),
              SizedBox(width: size.width * 0.02),
              Expanded(
                child: Text(
                  "$country - $competitionName. $matchRound",
                  style: CalendarTextStyle.title,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height * 0.025,
          child: Row(
            children: [
              SizedBox(width: size.width * 0.02),
              Text(
                '$formattedTime',
                style: CalendarTextStyle.time,
              ),
              SizedBox(width: size.width * 0.05),
              Expanded(
                child: Text(
                  '${match['homeTeam']['name']} vs ${match['awayTeam']['name']}',
                  style: CalendarTextStyle.subtitle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$scoreDisplay',
                style: CalendarTextStyle.score,
              ),
              SizedBox(width: size.width * 0.05),
              Text(
                displayStatus,
                style: CalendarTextStyle.subtitle,
              ),
              SizedBox(width: size.width * 0.02),
            ],
          ),
        ),
      ],
    );
  }

  String _getDisplayStatus(String matchStatus) {
    switch (matchStatus) {
      case 'SCHEDULED':
        return 'Not Started';
      case 'LIVE':
        return 'Live';
      case 'IN_PLAY':
        return 'In Play';
      case 'PAUSED':
        return 'Paused';
      case 'FINISHED':
        return 'Finished';
      case 'POSTPONED':
        return 'Postponed';
      case 'SUSPENDED':
        return 'Suspended';
      case 'CANCELED':
        return 'Canceled';
      default:
        return 'Unknown';
    }
  }
}
