import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              AppColors.blueColor, // Start color of the gradient (top)
              AppColors.blackColor, // End color of the gradient (bottom)
            ],
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: screenSize.height * 0.1,
          ),
          Text(newsModel.date),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FancyShimmerImage(
              height: screenSize.height * 0.3,
              width: screenSize.width * 0.9,
              boxFit: BoxFit.cover,
              imageUrl: newsModel.imageUrl,
            ),
          ),
          Text(newsModel.title),
          Flexible(
            child: Text(newsModel.text),
          ),
        ]),
      ),
    ));
  }
}
