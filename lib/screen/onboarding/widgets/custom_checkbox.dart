import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Function(bool?)? onChanged;
  final bool value;

  const CustomCheckBox(
      {Key? key,
      required this.tabController,
      required this.text,
      required this.onChanged,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
