import 'package:flutter/material.dart';

//import '../blocs/swipe/swipe_bloc.dart';
import '../model/model.dart';
import '../widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = '/User';

  static Route route({required User user}) {
    return MaterialPageRoute(
      builder: (context) => UserScreen(user: user),
      settings: RouteSettings(name: routeName),
    );
  }

  final User user;

  const UserScreen({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Hero(
                    tag: 'user_image',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            user.imageUrls[0],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            // context.read<SwipeBloc>()
                            //  ..add(SwipeLeft(user: state.users[0]));
                          },
                          child: ChoiceButton(
                            width: 60,
                            height: 60,
                            size: 25,
                            hasGradient: true,
                            color: Colors.red,
                            icon: Icons.clear_rounded,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // context.read<SwipeBloc>()
                            //   ..add(SwipeRight(user: state.users[0]));
                          },
                          child: ChoiceButton(
                            width: 80,
                            height: 80,
                            size: 30,
                            hasGradient: true,
                            color: Colors.red,
                            icon: Icons.favorite,
                          ),
                        ),
                        ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          hasGradient: false,
                          color: Colors.red,
                          icon: Icons.watch_later,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.age}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '${user.jobTitle}',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'About',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '${user.bio}',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 2),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Interest',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Row(
                  children: user.interests
                      .map(
                        (interest) => Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).accentColor,
                              ],
                            ),
                          ),
                          child: Text(interest,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white)),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
