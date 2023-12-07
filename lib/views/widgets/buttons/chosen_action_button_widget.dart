import 'package:flutter/material.dart';
import 'package:football_quiz/consts/app_colors.dart';

class ChosenActionButton extends StatelessWidget {
  const ChosenActionButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.1,
        left: size.width * 0.1,
        right: size.width * 0.1,
      ),
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.darkGrayColor, // Start color of the gradient
              AppColors.lightBlueColor, // End color of the gradient
            ],
            begin: Alignment.topLeft, // Start of the gradient
            end: Alignment.bottomRight, // End of the gradient
          ),
          borderRadius: BorderRadius.circular(40), // Border radius
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            // Make the button's background transparent
            onSurface: Colors.transparent,
            // Used when the button is disabled
            shadowColor: Colors.transparent,
            // Remove shadow for consistency
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(40), // Border radius matches Container
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }
}
