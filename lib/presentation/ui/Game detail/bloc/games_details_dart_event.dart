part of 'games_details_dart_bloc.dart';

class GamesDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetGamesDetail extends GamesDetailsEvent {
  final int idSelected;

  GetGamesDetail(this.idSelected);
  @override
  List<Object?> get props => [idSelected];
}
