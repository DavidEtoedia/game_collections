import 'package:game_collections/Data/model/creators.dart';
import 'package:game_collections/Data/model/game_achievements.dart';
import 'package:game_collections/Data/model/game_detail.dart';
import 'package:game_collections/Data/model/game_screenshots.dart';
import 'package:game_collections/Data/model/games.dart';

abstract class Irepo {
  Future<Games> getGames(int page);
  Future<Games> getSingleGame();
  Future<Games> latestRelease();
  Future<Creators> getCreators();
  Future<GameDetails> getGameDetail(int id);
  Future<GameScreenShots> getScreenShot(String screenShotId);
  Future<GameAchievements> getAchievements(int id);
  Future<Games> getPurchased(int page);
}
