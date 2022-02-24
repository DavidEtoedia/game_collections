import 'package:equatable/equatable.dart';
import 'package:game_collections/Data/model/games.dart';

class GamesController extends Equatable {
  final Games games;

  const GamesController({required this.games});

  @override
  // TODO: implement props
  List<Object?> get props => [games];
}
