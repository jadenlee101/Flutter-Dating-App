import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../blocs/blocs.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_container.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class Bio extends StatelessWidget {
  final TabController tabController;

  const Bio({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return CircularProgressIndicator();
        }
        if (state is OnboardingLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextHeader(
                      tabController: tabController,
                      text: 'Describe Yourself',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: controller,
                      //tabController: tabController,
                      text: 'Enter Your Bio',
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                            UpdateUser(user: state.user.copyWith(bio: value)));
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    CustomTextHeader(
                      tabController: tabController,
                      text: 'What Do You Like?',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomTextContainer(
                            tabController: tabController, text: 'Music'),
                        CustomTextContainer(
                            tabController: tabController, text: 'Art'),
                        CustomTextContainer(
                            tabController: tabController, text: 'Painting'),
                        CustomTextContainer(
                            tabController: tabController, text: 'Ski'),
                      ],
                    ),
                    Row(
                      children: [
                        CustomTextContainer(
                            tabController: tabController, text: 'Soccer'),
                        CustomTextContainer(
                            tabController: tabController, text: 'Economics'),
                        CustomTextContainer(
                            tabController: tabController, text: 'Hiking'),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 5,
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
          return Text('something worng');
        }
      },
    );
  }
}
