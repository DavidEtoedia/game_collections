import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/game_detail.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/component/loading_progress.dart';
import 'package:game_collections/presentation/ui/Game%20detail/bloc/games_details_dart_bloc.dart';

class GameDetailsScreen extends StatelessWidget {
  final int gameId;
  const GameDetailsScreen({
    Key? key,
    required this.gameId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GamesDetailsBloc>(context).add(GetGamesDetail(gameId));
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<GamesDetailsBloc, RequestState<GameDetails>>(
        builder: (context, state) {
          return state.when(
            idle: () => const LoadingProgress(),
            loading: () => const LoadingProgress(),
            error: (Object e, StackTrace s) => Text(e.toString()),
            success: (data) {
              return Text(data!.id.toString());
            },
          );
        },
      ),
    );
  }
}
