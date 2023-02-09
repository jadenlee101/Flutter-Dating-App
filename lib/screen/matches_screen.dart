import 'package:flutter/material.dart';

import '../model/model.dart';
import '../widgets/widgets.dart';

class MatchesScreen extends StatelessWidget {
  static const String routeName = '/Matches';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => MatchesScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isEmpty)
        .toList();
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chat!.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Matches')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Likes', style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: inactiveMatches.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        UserImageSmall(
                            height: 70,
                            width: 70,
                            imageUrl: inactiveMatches[index]
                                .matchedUser
                                .imageUrls[0]),
                        Text(inactiveMatches[index].matchedUser.name)
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Your Chat', style: Theme.of(context).textTheme.headline4),
              ListView.builder(
                itemCount: activeMatches.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Chat',
                          arguments: activeMatches[index]);
                    },
                    child: Row(children: [
                      UserImageSmall(
                          height: 70,
                          width: 70,
                          imageUrl:
                              activeMatches[index].matchedUser.imageUrls[0]),
                      Text(
                        activeMatches[index].chat![0].messages[0].message,
                      )
                    ]),
                  );
                },
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
