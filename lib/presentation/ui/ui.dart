import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/model/news.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/ui/Games/bloc/games_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final value = context.read<AllNewsBloc>();

    return Scaffold(
      body: BlocBuilder<GamesBloc, RequestState<Games>>(
          builder: (context, state) {
        return state.when(
          idle: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            print(error.toString());
            return Text(error.toString());
          },
          success: (value) {
            return ListView.builder(
                itemCount: value!.results!.length,
                itemBuilder: (context, index) {
                  final games = value.results![index];
                  return Text(games.name.toString());
                });
          },
        );
      }),
    );
  }
}
