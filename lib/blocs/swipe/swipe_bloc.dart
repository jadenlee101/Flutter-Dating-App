import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../../model/model.dart';
part 'swipe_state.dart';
part 'swipe_event.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsers>(_onLoadUsers);
    on<SwipeLeft>(_onSwipeLeft);
    on<SwipeRight>(_onSwipeRight);
  }

  void _onLoadUsers(
    LoadUsers event,
    Emitter<SwipeState> emit,
  ) {
    try {
      emit(SwipeLoaded(users: event.users));

      print('jere');
    } catch (e) {
      print(e);
    }
  }

  void _onSwipeLeft(SwipeLeft event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
    }
  }

  void _onSwipeRight(SwipeRight event, Emitter<SwipeState> emit) {
    if (state is SwipeLoaded) {
      final state = this.state as SwipeLoaded;
      try {
        emit(SwipeLoaded(users: List.from(state.users)..remove(event.user)));
      } catch (_) {}
    }

    Stream<SwipeState> _mapSwipeLeftToState(
      //SwipeLeftEvent event,
      SwipeState state,
    ) async* {
      if (state is SwipeLoaded) {
        try {
          //  yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
        } catch (_) {}
      }
    }

    Stream<SwipeState> _mapSwipeRightToState(
      // SwipeRightEvent event,
      SwipeState state,
    ) async* {
      if (state is SwipeLoaded) {
        try {
          yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
        } catch (_) {}
      }
    }
  }
}
