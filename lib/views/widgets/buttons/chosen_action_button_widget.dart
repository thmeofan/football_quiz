import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';

class ChosenActionButton extends StatelessWidget {
  const ChosenActionButton(
      {super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.1,
        left: size.width * 0.1,
        right: size.width * 0.1,
      ),
      child: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.07,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            backgroundColor: AppColors.lightBlueColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: Size(232, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Border radius
            ),
          ),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
