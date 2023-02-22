//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';

import 'blocs/auth/auth_bloc.dart';

import 'blocs/images/onboarding_bloc.dart';
import 'blocs/swipe/swipe_bloc.dart';
import 'config/app_router.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'config/theme.dart';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/user_model.dart';
import 'repositories/auth/auth_repository.dart';
import 'repositories/database/database_repository.dart';
import 'repositories/storage/storage_repository.dart';
import 'screen/screens.dart';

//import 'blocs/blocs.dart';
//import 'cubits/cubits.dart';
//import 'repositories/repositories.dart';
//import 'screens/screens.dart';
//import 'config/theme.dart';
//import 'config/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: ((context) => AuthRepository())),
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          //  BlocProvider<OnboardingBloc>(
          //   create: (context) => OnboardingBloc(
          //    databaseRepository: context.read<DatabaseRepository>(),
          //      storageRepository: context.read<StorageRepository>(),
          //    ),
          //  ),
          // BlocProvider(
          //   create: (_) => ImagesBloc(
          //     databaseRepository: DatabaseRepository(),
          //   )..add(LoadImages()),
          // ),
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider(
            create: (context) => SwipeBloc()..add(LoadUsers(users: User.users)),
          ),
        ],
        child: MaterialApp(
          title: 'test',
          theme: theme(),
          //home: HomeScreen(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
