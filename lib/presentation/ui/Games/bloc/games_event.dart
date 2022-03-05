part of 'games_bloc.dart';

// @freezed
abstract class GamesEvent extends Equatable {}

class FetchGamesEvent extends GamesEvent {
  @override
  List<Object?> get props => [];
}
