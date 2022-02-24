import 'package:game_collections/Data/model/games.dart';

import '../../../Data/model/gamez.dart';

abstract class GameState {
  const GameState();
}

class GamezInitialState extends GameState {
  const GamezInitialState();
}

class GameLoadingState extends GameState {
  final Games oldgames;
  final bool isFirstFetch;

  const GameLoadingState(this.oldgames, {this.isFirstFetch = false});
}

class GameSuccessState extends GameState {
  final Games games;

  const GameSuccessState({
    required this.games,
  });
}

class GameErrorState extends GameState {
  final String error;

  const GameErrorState({
    required this.error,
  });
}
