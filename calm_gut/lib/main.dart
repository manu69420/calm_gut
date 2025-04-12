import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:calm_gut/app/ui/app.dart';
import 'package:calm_gut/app/utils/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  // final firestore = const FirebaseOptions(
  //   apiKey: "AIzaSyACDf0YQ1ezDwE_QltyJsdyn2xCWgou_8Y",
  //   appId: "1:842172376972:android:f3434c4134327c8ea758a9",
  //   messagingSenderId: "682609745797",
  //   projectId: 'calm-gut',
  // );
  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}
