import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/repository/game_i_repo.dart';
import 'package:game_collections/Data/services/game_service.dart';

import '../model/gamez.dart';

class GamesRepository extends Irepo {
  final GamesService gamesService;
  GamesRepository({
    required this.gamesService,
  });

  @override
  Future<Games> getGames(int page) async => gamesService.getGames(page);
  Future<List<Res>> getResult(int page) => gamesService.getResult(page);
}
