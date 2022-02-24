import 'package:equatable/equatable.dart';
import 'package:game_collections/Data/model/games.dart';

enum AllGamesStatus { initial, success, error, loading }

extension AllGamesStatusX on AllGamesStatus {
  bool get isInitial => this == AllGamesStatus.initial;
  bool get isSuccess => this == AllGamesStatus.success;
  bool get isError => this == AllGamesStatus.error;
  bool get isLoading => this == AllGamesStatus.loading;
}

class AllGamesState extends Equatable {
  AllGamesState({
    this.status = AllGamesStatus.initial,
    required this.oldgames,
    this.pages = 1,
    Games? games,
  }) : games = games ?? Games.empty;

  final Games games;
  final Games oldgames;
  final AllGamesStatus status;
  final int pages;

  @override
  List<Object?> get props => [status, games, pages, oldgames];

  AllGamesState copyWith({
    Games? games,
    int? pages,
    Games? oldgames,
    AllGamesStatus? status,
  }) {
    return AllGamesState(
        games: games ?? this.games,
        status: status ?? this.status,
        oldgames: oldgames ?? this.oldgames,
        pages: pages ?? this.pages);
  }
}
