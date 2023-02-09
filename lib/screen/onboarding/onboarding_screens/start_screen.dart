import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_button.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: SvgPicture.asset('assets/couple.svg'),
              ),
              const SizedBox(height: 50),
              Text(
                'Welcome to Foggle',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'fseffsefef sfefsf esfseefsf efsfse fsef efs fesf fesfe fesfe fesfe fesfes efsf',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(height: 1.8),
              ),
            ],
          ),
          CustomButton(
            tabController: tabController,
            title: 'Start',
          )
        ],
      ),
    );
  }
}
