import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internetbloc/internet_bloc.dart';
import 'bloc/internetbloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return Text(
                "Connected",
                style: TextStyle(fontSize: 30),
              );
            } else if (state is InternetLostState) {
              return Text(
                "Not Connected",
                style: TextStyle(fontSize: 30),
              );
            } else {
              return Text(
                "Loading...",
                style: TextStyle(fontSize: 30),
              );
            }
          },
        ),
      ),
    );
  }
}
