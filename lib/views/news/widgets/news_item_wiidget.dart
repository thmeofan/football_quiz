import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:football_quiz/consts/app_colors.dart';
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
          height: screenSize.height * 0.18,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.02,
              horizontal: screenSize.width * 0.04),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.blueColor,
          ),
          child: Row(
            children: [
              ClipRRect(
                child: FancyShimmerImage(
                  height: screenSize.height * 0.3,
                  width: screenSize.width * 0.4,
                  boxFit: BoxFit.cover,
                  imageUrl: newsModel.imageUrl,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      newsModel.title,
                      maxLines: 1,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      newsModel.text,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      newsModel.date,
                    ),
                  ],
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
