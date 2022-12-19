import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetconnectivityusingbloc/bloc/counterbloc/event.dart';

import 'bloc/counterbloc/count_bloc.dart';
import 'bloc/counterbloc/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              bloc.add(IncrementEvent());
            },
          ),
          SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            child: Icon(Icons.access_alarm_outlined),
            onPressed: () => bloc.add(
              DecrementEvent(),
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text('counter value ${bloc.state.counter}');
          },
        ),
      ),
    );
  }
}
