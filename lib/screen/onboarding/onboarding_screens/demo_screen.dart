import 'package:flutter/material.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class Demo extends StatelessWidget {
  final TabController tabController;

  const Demo({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
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
                controller: controller,
                //tabController: tabController,
                text: 'Enter Your Age',
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
              CustomCheckBox(tabController: tabController, text: 'Male'),
              CustomCheckBox(tabController: tabController, text: 'Female'),
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
              CustomButton(tabController: tabController, title: 'Next Step')
            ],
          ),
        ],
      ),
    );
  }
}
