import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../blocs/images/images_bloc.dart';
import '../../../blocs/images/onboarding_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_container.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;

  const Pictures({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
      if (state is OnboardingLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is OnboardingLoaded) {
        var images = state.user.imageUrls;
        var imageCount = images.length;
        print('picture_screen images ${images}');

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
                    text: 'Add 2 or More Picture',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 350,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 0.66),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return (imageCount > index)
                              ? CustomImageContainer(
                                  tabController: tabController,
                                  imageUrl: images[index])
                              : CustomImageContainer(
                                  tabController: tabController);
                        }),
                  )
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 4,
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
      } else {
        return Text('Something went worng ');
      }
    });
  }
}
