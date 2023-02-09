import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../blocs/blocs.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class Demo extends StatelessWidget {
  final TabController tabController;

  const Demo({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller = TextEditingController();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomTextHeader(
                      tabController: tabController,
                      text: 'What\'s Your Age?',
                    ),
                    CustomTextField(
                      //controller: controller,
                      //tabController: tabController,
                      text: 'Enter Your Age',
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(UpdateUser(
                              user: state.user.copyWith(
                                age: int.parse(value),
                              ),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    CustomTextHeader(
                      tabController: tabController,
                      text: 'What\'s Your Gender?',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomCheckBox(
                      tabController: tabController,
                      text: 'Male',
                      value: state.user.gender == 'Male',
                      onChanged: (bool? newValue) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(gender: 'Male'),
                              ),
                            );
                      },
                    ),
                    CustomCheckBox(
                      tabController: tabController,
                      text: 'Female',
                      value: state.user.gender == 'Female',
                      onChanged: (bool? newValue) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(gender: 'Female'),
                              ),
                            );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 3,
                      selectedColor: Theme.of(context).primaryColor,
                      unselectedColor: Theme.of(context).backgroundColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        tabController: tabController, title: 'Next Step')
                  ],
                ),
              ],
            ),
          );
        } else {
          return Text('something went wrong');
        }
      },
    );
  }
}
