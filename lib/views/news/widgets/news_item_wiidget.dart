import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/consts/app_colors.dart';
import 'package:football_quiz/consts/app_text_styles/news_text_style.dart';
import 'package:football_quiz/data/models/news_model.dart';

import '../../../util/app_routes.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.article, arguments: newsModel);
        },
        child: Container(
          height: screenSize.height * 0.15,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.blueColor,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FancyShimmerImage(
                  width: screenSize.width * 0.4,
                  boxFit: BoxFit.cover,
                  imageUrl: newsModel.imageUrl,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsModel.title,
                        maxLines: 1,
                        style: NewsTextStyle.title,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Expanded(
                        child: Text(
                          newsModel.text,
                          style: NewsTextStyle.preview,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Text(
                        newsModel.date,
                        style: NewsTextStyle.date,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
