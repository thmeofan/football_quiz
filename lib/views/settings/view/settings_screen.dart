import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_quiz/consts/app_text_styles/onboarding_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../consts/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _launchURL() async {
    Uri url = Uri.parse('https://google.com/');
    if (await canLaunchUrl(url)) {
      final bool launched = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        throw 'Could not launch $url';
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Settings'),
        centerTitle: true,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.2,
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/tick_square.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightBlueColor,
                  ),
                  label: Text(
                    'Privacy Policy',
                    style: OnboardingTextStyle.introduction,
                  )),
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/chat.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightBlueColor,
                  ),
                  label: const Text(
                    'Terms of use',
                    style: OnboardingTextStyle.introduction,
                  )),
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/bag.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightBlueColor,
                  ),
                  label: Text(
                    'Subscription info',
                    style: OnboardingTextStyle.introduction,
                  )),
            ),
            ListTile(
              title: TextButton.icon(
                  onPressed: () {
                    _launchURL;
                  },
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  icon: SvgPicture.asset(
                    'assets/icons/star.svg',
                    width: 26,
                    height: 26,
                    color: AppColors.lightBlueColor,
                  ),
                  label: Text(
                    'Rate app',
                    style: OnboardingTextStyle.introduction,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
