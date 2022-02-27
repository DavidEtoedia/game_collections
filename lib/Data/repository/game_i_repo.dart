import 'package:game_collections/Data/model/creators.dart';
import 'package:game_collections/Data/model/game_release.dart';
import 'package:game_collections/Data/model/games.dart';

abstract class Irepo {
  Future<Games> getGames(int page);
  Future<Games> getSingleGame();
  Future<Games> latestRelease();
  Future<Creators> getCreators();
}
