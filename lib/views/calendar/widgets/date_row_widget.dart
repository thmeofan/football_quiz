import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/consts/app_colors.dart';
import 'package:football_quiz/consts/app_text_styles/calendar_text_style.dart';
import 'package:intl/intl.dart';

class DateRowWidget extends StatefulWidget {
  const DateRowWidget({super.key});

  @override
  _DateRowWidgetState createState() => _DateRowWidgetState();
}

class _DateRowWidgetState extends State<DateRowWidget> {
  DateTime selectedDate = DateTime.now();
  bool isIconClicked = false;

  void _presentDatePicker(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.blueColor,
              onPrimary: AppColors.lightGreyColor,
              onSurface: AppColors.lightGreyColor,
              surface: AppColors.lightGreyColor,
            ),
            dialogTheme: const DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColors.blueColor,
              ),
            ),
            textTheme: const TextTheme(
              subtitle1: TextStyle(color: AppColors.lightGreyColor),
              headline4: TextStyle(color: AppColors.lightGreyColor),
              bodyText2: TextStyle(color: AppColors.whiteColor),
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      selectableDayPredicate: (DateTime val) {
        return true;
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formattedDate = formatter.format(selectedDate);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(formattedDate, style: CalendarTextStyle.title),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/calendar-days.svg',
            color: isIconClicked
                ? AppColors.lightBlueColor
                : AppColors.lightGreyColor,
          ),
          onPressed: () => _presentDatePicker(context),
        ),
      ],
    );
  }
}
