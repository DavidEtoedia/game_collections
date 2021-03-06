import 'package:game_collections/Data/model/creators.dart';
import 'package:game_collections/Data/model/game_achievements.dart';
import 'package:game_collections/Data/model/game_detail.dart';
import 'package:game_collections/Data/model/game_screenshots.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/repository/game_i_repo.dart';
import 'package:game_collections/Data/services/game_service.dart';

class GamesRepository extends Irepo {
  final GamesService gamesService;
  GamesRepository({
    required this.gamesService,
  });

  @override
  Future<Games> getGames(int page) async => gamesService.getGames(page);

  @override
  Future<Games> latestRelease() async => gamesService.latestRelease();

  @override
  Future<Creators> getCreators() => gamesService.getCreators();

  @override
  Future<Games> getSingleGame() => gamesService.getSingleGame();

  @override
  Future<GameDetails> getGameDetail(int id) => gamesService.getGameDetail(id);

  @override
  Future<GameScreenShots> getScreenShot(String screenShotId) =>
      gamesService.getScreenShot(screenShotId);

  @override
  Future<GameAchievements> getAchievements(int id) =>
      gamesService.getAchievements(id);

  @override
  Future<Games> getPurchased(int page) => gamesService.getPurchased(page);
}
