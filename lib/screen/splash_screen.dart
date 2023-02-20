import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Scaffold(
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
    ));
  }
}
