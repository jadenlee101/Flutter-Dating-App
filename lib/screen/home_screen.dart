import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../blocs/swipe/swipe_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/Home';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Foggle'),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SwipeLoaded) {
            return Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/User',
                      arguments: state.users[0]);
                },
                child: Draggable(
                  child: UserCard(user: state.users[0]),
                  feedback: UserCard(user: state.users[0]),
                  childWhenDragging: UserCard(user: state.users[1]),
                  onDragEnd: (drag) {
                    if (drag.velocity.pixelsPerSecond.dx < 0) {
                      context.read<SwipeBloc>()
                        ..add(SwipeLeft(user: state.users[0]));
                      print('swipe left');
                    } else {
                      context.read<SwipeBloc>()
                        ..add(SwipeRight(user: state.users[0]));
                      print('swipe right');
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 60,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<SwipeBloc>()
                          ..add(SwipeLeft(user: state.users[0]));
                      },
                      child: ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        hasGradient: false,
                        color: Colors.red,
                        icon: Icons.clear_rounded,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.read<SwipeBloc>()
                          ..add(SwipeRight(user: state.users[0]));
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
            ]);
          } else {
            return Text('Something went wrong');
          }
        },
      ),
    );
  }
}
