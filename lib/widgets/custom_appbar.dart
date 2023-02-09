import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasActions = true,
  }) : super(key: key);

  final String title;
  final bool hasActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  //fontFamily: 'optima',
                )),
          ),
        ],
      ),
      actions: hasActions
          ? [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Matches');
                },
                icon: Icon(
                  Icons.message,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Profile');
                },
                icon: Icon(
                  Icons.person,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ]
          : null,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
