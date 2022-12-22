import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetconnectivityusingbloc/bloc/apibloc/apievent.dart';
import 'package:internetconnectivityusingbloc/repos/repositories.dart';

import 'bloc/apibloc/apibloc.dart';
import 'bloc/apibloc/apistate.dart';
import 'bloc/counterbloc/count_bloc.dart';
import 'repos/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepositories>(context))
            ..add(UserLoadingEvent()),
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> listUser = state.users;
              return ListView.builder(
                  itemCount: listUser.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.blue,
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            listUser[index].firstName.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            listUser[index].lastName.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(listUser[index].avatar.toString()),
                          ),
                        ),
                      ),
                    );
                  });
            }
            if (state is UserErrorState) {
              return Text("Get Error");
            }
            return Container();
          },
        ),
      ),
    );
  }
}
