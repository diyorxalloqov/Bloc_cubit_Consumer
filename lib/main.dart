import 'package:bloc_consumer_app/cubit/Comments_state.dart';
import 'package:bloc_consumer_app/ui/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: ((context) => CommentsCubit()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
