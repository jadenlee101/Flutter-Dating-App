import 'package:Foggle/blocs/images/onboarding_bloc.dart';
import 'package:Foggle/repositories/database/database_repository.dart';
import 'package:Foggle/repositories/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../../cubits/signup/signup_cubit.dart';
import '../../repositories/auth/auth_repository.dart';

import '../../widgets/custom_appbar.dart';
import 'onboarding_screens/screens.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/Onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => OnboardingScreen(),
    );
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    Tab(text: 'EmailVerifcation'),
    Tab(text: 'Demo'),
    Tab(text: 'Pictures'),
    Tab(text: 'Bio'),
    Tab(
      text: 'Location',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: ((context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Foggle',
              hasActions: false,
            ),
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              Start(tabController: tabController),
              Email(tabController: tabController),
              EmailVerifcation(tabController: tabController),
              Demo(tabController: tabController),
              Pictures(tabController: tabController),
              Bio(tabController: tabController),
              Location(tabController: tabController)
            ]),
          );
        }),
      ),
    );
  }
}
