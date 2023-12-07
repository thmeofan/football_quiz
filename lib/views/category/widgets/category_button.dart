import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../../consts/app_colors.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.text, required this.onTap});

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
        child: ClipRRect(
          // Use ClipRRect to clip the blur effect to the border radius
          borderRadius: BorderRadius.circular(40),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            // Adjust the blur intensity
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white.withOpacity(0.2),
                // Apply semi-transparent white color
                border: Border.all(
                  color: AppColors.whiteColor,
                  width: 1.5,
                ),
              ),
              child: TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(232, 56),
                ),
                child: Text(
                  text,
                ),
              ),
            ),
          ),
        ));
  }
}
