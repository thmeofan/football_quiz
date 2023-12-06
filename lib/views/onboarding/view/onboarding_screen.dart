import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../util/app_routes.dart';
import '../../widgets/buttons/chosen_action_button_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    this.isFirstTime,
  });
  final isFirstTime;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          ChosenActionButton(
              text: 'Continue',
              onTap: () async {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
                context.read<OnboardingCubit>().setFirstTime();
              }),
        ],
      ),
    );
  }
}
