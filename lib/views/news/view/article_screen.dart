import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/consts/app_text_styles/news_text_style.dart';
import 'package:football_quiz/data/models/news_model.dart';

import '../../../consts/app_colors.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('News'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            width: 24.0,
            height: 24.0,
          ),
        ),
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
        child: Column(children: [
          SizedBox(
            height: screenSize.height * 0.1,
          ),
          Text(
            newsModel.date,
            style: NewsTextStyle.date,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FancyShimmerImage(
                // height: screenSize.height * 0.3,
                width: screenSize.width * 0.9,
                boxFit: BoxFit.cover,
                imageUrl: newsModel.imageUrl,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.04,
                vertical: screenSize.width * 0.01),
            child: Text(
              newsModel.title,
              style: NewsTextStyle.articleTitle,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.04),
            child: Text(
              newsModel.text,
              style: NewsTextStyle.articleText,
            ),
          ),
        ]),
      ),
    ));
  }
}
