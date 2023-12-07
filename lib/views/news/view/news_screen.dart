import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              // actions: <Widget>[
              //   IconButton(
              //     icon: SvgPicture.asset(
              //       'assets/icons/21-san.svg',
              //       width: 24.0,
              //       height: 24.0,
              //     ),
              //     onPressed: () => Navigator.pushNamed(
              //       context,
              //       AppRoutes.qrScreen,
              //     ),
              //   ),
              // ],
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
