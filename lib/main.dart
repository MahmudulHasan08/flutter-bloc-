import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetconnectivityusingbloc/bloc/counterbloc/count_bloc.dart';

import 'package:internetconnectivityusingbloc/homescreen.dart';
import 'package:internetconnectivityusingbloc/repos/repositories.dart';

void main() {
  UserRepositories userrepo = UserRepositories();
  userrepo.getUsers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepositories(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
