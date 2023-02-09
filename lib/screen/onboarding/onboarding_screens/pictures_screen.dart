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
    //return BlocBuilder<OnboardingBloc, OnboardingState>(
    //  builder: (context, state) {
    //   if (state is OnboardingLoading) {
    //      return Center(
    ////       child: CircularProgressIndicator(),
    //      );
    //   }
    //   if (state is OnboardingLoaded) {
    //     var images = state.user.imageUrls;
    //    var imageCount = images.length;

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
                height: 10,
              ),
              BlocBuilder<ImagesBloc, ImagesState>(builder: (context, state) {
                if (state is ImagesLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ImagesLoaded) {
                  var imagesCount = state.imageUrls.length;
                  return Column(
                    children: [
                      Row(
                        children: [
                          (imagesCount > 0)
                              ? CustomImageContainer(
                                  tabController: tabController,
                                  imageUrl: state.imageUrls[0],
                                )
                              : CustomImageContainer(
                                  tabController: tabController),
                          (imagesCount > 1)
                              ? CustomImageContainer(
                                  tabController: tabController,
                                  imageUrl: state.imageUrls[1],
                                )
                              : CustomImageContainer(
                                  tabController: tabController),
                          (imagesCount > 2)
                              ? CustomImageContainer(
                                  tabController: tabController,
                                  imageUrl: state.imageUrls[2],
                                )
                              : CustomImageContainer(
                                  tabController: tabController),
                        ],
                      ),
                      Row(
                        children: [
                          (imagesCount > 3)
                              ? CustomImageContainer(
                                  tabController: tabController,
                                  imageUrl: state.imageUrls[3],
                                )
                              : CustomImageContainer(
                                  tabController: tabController),
                          (imagesCount > 4)
                              ? CustomImageContainer(
                                  tabController: tabController,
                                  imageUrl: state.imageUrls[4],
                                )
                              : CustomImageContainer(
                                  tabController: tabController),
                          (imagesCount > 5)
                              ? CustomImageContainer(
                                  tabController: tabController,
                                  imageUrl: state.imageUrls[5],
                                )
                              : CustomImageContainer(
                                  tabController: tabController),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Text('Something wrong');
                }
              }),
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
    //  } else {
    //    return Text('Something went worng ');
    //   }
    // },
    // );
  }
}
