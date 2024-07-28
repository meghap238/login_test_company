import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_zentech/bloc/user_bloc.dart';
import 'package:test_project_zentech/repository/repository.dart';
import 'package:test_project_zentech/screen/home_screen.dart';
import 'package:test_project_zentech/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: HomeScreen(),
      home: BlocProvider(
          create: (context) => UserBloc(Repository()),
          child: LoginScreen()),
    );
  }
}

