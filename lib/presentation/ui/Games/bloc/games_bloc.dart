import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/model/news.dart';
import 'package:game_collections/Data/repository/game_repo.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/Data/services/news_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';

part 'games_event.dart';
// part 'games_state.dart';
// part 'games_bloc.freezed.dart';

class GamesBloc extends Bloc<GamesEvent, RequestState<Games>> {
  GamesBloc() : super(const RequestState.idle()) {
    on<GamesEvent>(_mapEventToState);
  }

  final gameRepository = GamesService();

  void _mapEventToState(event, emit) async {
    try {
      final res = await gameRepository.getGames();
      emit(RequestState.success(res));
    } catch (e, s) {
      RequestState.error(e, s);

      print(e);
    }
  }
}
