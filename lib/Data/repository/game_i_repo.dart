import 'package:game_collections/Data/model/games.dart';

abstract class Irepo {
  Future<Games> getGames(int page);
}
