import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../data/repository/api_repository.dart';
import '../widgets/date_row_widget.dart';
import '../widgets/match_item_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<dynamic> matches = [];
  final ApiRepository apiRepository = ApiRepository();
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchTodayMatches();
  }

  void fetchTodayMatches() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      var todayMatches = await apiRepository.fetchTodayMatches();
      if (!mounted) return;

      if (todayMatches.isEmpty) {
        fetchMatches();
      } else {
        setState(() {
          matches = todayMatches;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void fetchMatches() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      var fetchedMatches = await apiRepository.fetchMatches();

      if (!mounted) return;

      setState(() {
        matches = fetchedMatches;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _isLoading ? _buildLoadingIndicator() : _buildBody(size),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text('Match Calendar'),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
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
      child: const Center(
          child: CircularProgressIndicator(
        color: AppColors.blueColor,
      )),
    );
  }

  Widget _buildBody(Size size) {
    if (_errorMessage.isNotEmpty) {
      return _buildErrorWidget();
    }

    if (matches.isEmpty) {
      return _buildNoMatchesWidget();
    }

    return _buildMatchList(size);
  }

  Widget _buildErrorWidget() {
    return Container(
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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _errorMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.lightBlueColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoMatchesWidget() {
    return Center(child: Text('No matches for today'));
  }

  Widget _buildMatchList(Size size) {
    return Container(
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
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.1,
            ),
            child: DateRowWidget(),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: matches.length,
              itemBuilder: (context, index) {
                return MatchItemWidget(match: matches[index], size: size);
              },
            ),
          ),
        ],
      ),
    );
  }
}
