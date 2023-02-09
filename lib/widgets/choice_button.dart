import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;

  const ChoiceButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.size,
      required this.color,
      required this.icon,
      required this.hasGradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            gradient: hasGradient
                ? LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.yellow,
                    ],
                  )
                : LinearGradient(colors: [Colors.green, Colors.grey]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(90),
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(3, 3),
              ),
            ]),
        child: Icon(
          icon,
          color: color,
          size: size,
        ));
  }
}
