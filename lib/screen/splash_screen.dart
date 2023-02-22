import 'dart:async';

import 'package:Foggle/screen/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/blocs.dart';
import 'screens.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => SplashScreen(),
        settings: RouteSettings(name: routeName));
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print('Listener');
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              Duration(seconds: 1),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                OnboardingScreen.routeName,
                ModalRoute.withName('/onboarding'),
              ),
            );
          } else if (state.status == AuthStatus.authenticated) {
            Timer(Duration(seconds: 1),
                () => Navigator.of(context).pushNamed(HomeScreen.routeName));
          }
        },
        child: Scaffold(
            body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/logo.svg', height: 100),
              SizedBox(height: 20),
              Text(
                'Foggle',
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          )),
        )),
      ),
    );
  }
}
