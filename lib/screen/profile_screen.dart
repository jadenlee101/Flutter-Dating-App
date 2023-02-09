import 'package:flutter/material.dart';

import '../model/model.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/Profile';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => ProfileScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];

    return Scaffold(
        appBar: CustomAppBar(title: 'Profile Screen'),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(user.imageUrls[0]),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWithIcon(title: 'Biography', icon: Icons.edit),
                  Text(user.bio,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(height: 1.5)),
                  TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                  SizedBox(
                    height: 125,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              height: 125,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(user.imageUrls[index]),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  TitleWithIcon(title: 'Location', icon: Icons.edit),
                  Text('Edmonton'),
                  TitleWithIcon(title: 'Interests', icon: Icons.edit),
                ],
              ),
            )
          ],
        ));
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const TitleWithIcon({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        IconButton(onPressed: (() {}), icon: Icon(icon))
      ],
    );
  }
}
