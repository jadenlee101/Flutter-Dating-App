import 'package:Foggle/blocs/images/onboarding_bloc.dart';
import 'package:Foggle/model/model.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/signup/signup_cubit.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;

  final String title;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          onPressed: () async {
            tabController.animateTo(tabController.index + 1);
            print('here');
            if (tabController.index == 2) {
              await context.read<SignupCubit>().signUpWithCredentials();
              print('');

              User user = User(
                id: context.read<SignupCubit>().state.user!.uid,
                name: ' ',
                age: 0,
                gender: '',
                imageUrls: [],
                interests: [],
                bio: ' ',
                jobTitle: ' ',
                location: '',
              );
              context.read<OnboardingBloc>().add(StartOnboarding(
                    user: user,
                  ));
            }
          },
          child: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
