import 'dart:async';
//import 'dart:html';

import 'package:Foggle/repositories/database/database_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _databaseSubscribtion;

  ImagesBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(ImagesLoading()) {
    on<LoadImages>(_onLoadImages);
    on<UpdateImages>(_UpdateImages);
  }

  void _onLoadImages(LoadImages event, Emitter<ImagesState> emit) async {
    _databaseSubscribtion?.cancel();
    _databaseRepository
        .getUser()
        .listen((user) => add(UpdateImages(user.imageUrls)));
  }
}

void _UpdateImages(UpdateImages event, Emitter<ImagesState> emit) {
  emit(ImagesLoaded(imageUrls: event.imageUrls));
}
