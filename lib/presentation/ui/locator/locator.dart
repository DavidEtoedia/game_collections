import 'package:game_collections/Data/repository/game_repo.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
final gameService = GamesService();

void setUp() {
  locator.registerLazySingleton<GamesRepository>(
      () => GamesRepository(gamesService: gameService));
}
