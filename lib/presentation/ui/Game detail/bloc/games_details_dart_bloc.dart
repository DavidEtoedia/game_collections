import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_collections/Data/model/game_detail.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';

part 'games_details_dart_event.dart';
// part 'games_details_dart_state.dart';
// part 'games_details_dart_bloc.freezed.dart';

class GamesDetailsBloc
    extends Bloc<GamesDetailsEvent, RequestState<GameDetails>> {
  GamesDetailsBloc() : super(const RequestState.idle()) {
    on<GetGamesDetail>(_fetchGameDetail);
  }
  final gameRepository = GamesService();
  void _fetchGameDetail(
      GetGamesDetail event, Emitter<RequestState> emit) async {
    try {
      emit(const RequestState<GameDetails>.loading());
      final response = await gameRepository.getGameDetail(event.idSelected);
      emit(RequestState<GameDetails>.success(response));
    } catch (e, s) {
      emit(RequestState<GameDetails>.error(e, s));
    }
  }
}
