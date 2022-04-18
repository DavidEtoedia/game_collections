import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/services/game_service.dart';

part 'purchased_games_event.dart';
part 'purchased_games_state.dart';

class PurchasedGamesBloc extends Bloc<GetPurchasedEvent, PurchasedGameState> {
  PurchasedGamesBloc() : super(PurchasedGameState.initial()) {
    on<FetchPurchased>(_fetchPurchased);
  }

  final gameRepository = GamesService();
  int page = 5;

  Future<void> _fetchPurchased(FetchPurchased event, emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(isLoading: true));

    try {
      if (state.status == PurchasedStatus.initial) {
        final games = await gameRepository.getGames(page);
        return emit(state.copyWith(
            status: PurchasedStatus.success,
            result: games.results,
            hasReachedMax: false));
      }

      if (state.status == PurchasedStatus.success) {
        page++;
        final games = await gameRepository.getPurchased(page);
        games.results!.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: PurchasedStatus.success,
                result: List.of(state.result)..addAll(games.results!.toList()),
                hasReachedMax: false,
              ));
      }
    } catch (e) {
      emit(state.copyWith(
          status: PurchasedStatus.failure, errorMessage: e.toString()));
      emit(state.copyWith(isLoading: false));
      // print(e);
    }
  }
}
