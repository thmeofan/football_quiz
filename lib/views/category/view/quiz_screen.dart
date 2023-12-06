import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_quiz/consts/app_colors.dart';
import 'dart:async';

import '../../../data/models/quiz_model.dart';
import '../../../util/progress_manger.dart';
import '../widgets/option_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.questions});
  final List<Question> questions;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  int _questionNumber = 1;
  bool _isQuizFinished = false;
  int calculateScore() {
    int score = 0;
    for (var question in widget.questions) {
      if (question.isLocked && question.selectedOption?.isCorrect == true) {
        score++;
      }
    }
    return score;
  }

  void showResults() {
    int score = calculateScore();
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Results"),
        content: Text("You scored $score out of ${widget.questions.length}."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Text('$_questionNumber/${widget.questions.length}'),
            Expanded(
                child: PageView.builder(
              itemCount: widget.questions.length,
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (_isQuizFinished) {}
                final question = widget.questions[index];
                return buildQuestion(question);
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget buildQuestion(Question? question) {
    if (_isQuizFinished) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "You scored ${calculateScore()} out of ${widget.questions.length}.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(question!.text),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: question.isLocked
                    ? (question.selectedOption?.isCorrect ?? false
                        ? AppColors.lightBlueColor
                        : AppColors.redColor)
                    : AppColors.lightGrayColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Expanded(
            child: OptionWidget(
                question: question,
                onClickedOption: (option) {
                  if (question.isLocked) {
                    return;
                  } else {
                    setState(() {
                      question.isLocked = true;
                      question.selectedOption = option;
                    });

                    Future.delayed(Duration(seconds: 1), () async {
                      if (_controller.page!.toInt() ==
                          widget.questions.length - 1) {
                        int score = calculateScore();
                        await onQuizCompleted( question.category , score);
                        setState(() {
                          _isQuizFinished = true;
                        });
                      } else {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        setState(() {
                          _questionNumber += 1;
                        });
                      }
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? AppColors.lightBlueColor : AppColors.redColor;
      } else if (option.isCorrect) {
        return AppColors.lightBlueColor;
      }
    }
    return AppColors.lightGrayColor;
  }
}
