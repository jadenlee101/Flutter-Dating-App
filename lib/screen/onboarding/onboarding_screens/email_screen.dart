import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../cubits/signup/signup_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class Email extends StatelessWidget {
  final TabController tabController;

  const Email({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomTextHeader(
                    tabController: tabController,
                    text: 'What\'s your email?',
                  ),
                  CustomTextField(
                    //tabController: tabController,
                    text: 'Enter your email',
                    onChanged: (value) {
                      context.read<SignupCubit>().emailChanged(value);
                      print(state.email);
                      print('aaaa');
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  CustomTextHeader(
                    tabController: tabController,
                    text: 'Choose a password?',
                  ),
                  CustomTextField(
                    //tabController: tabController,
                    text: 'Enter your password',
                    onChanged: ((value) {
                      context.read<SignupCubit>().passwordChanged(value);
                      print(state.password);
                    }),
                  )
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 1,
                    selectedColor: Theme.of(context).primaryColor,
                    unselectedColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    tabController: tabController,
                    title: 'Next Step',
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
