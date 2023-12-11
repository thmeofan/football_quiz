import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../data/models/news_model.dart';
import '../widgets/news_item_wiidget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.newsModel});

  final List<NewsModel> newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Football news',
              ),
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
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: newsModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsItemWidget(newsModel: newsModel[index]);
                    },
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
              ]),
            )));
  }
}
