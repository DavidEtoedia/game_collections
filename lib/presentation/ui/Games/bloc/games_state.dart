part of 'games_bloc.dart';

@immutable
abstract class GamesState {
  const GamesState();
}

class GameInitialState extends GamesState {
  const GameInitialState();
}

class GameLoading extends GamesState {
  const GameLoading();
}

class GameLoaded extends GamesState {
  final Games game;
  const GameLoaded(this.game);
}

class GameFailure extends GamesState {
  final String message;
  const GameFailure(this.message);
}
