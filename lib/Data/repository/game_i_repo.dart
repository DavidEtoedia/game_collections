import 'package:game_collections/Data/model/game_release.dart';
import 'package:game_collections/Data/model/games.dart';

abstract class Irepo {
  Future<Games> getGames(int page);
  Future<Games> latestRelease();
}
