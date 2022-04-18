import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_collections/Data/model/game_achievements.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';

part 'achievements_event.dart';

class AchievementsBloc
    extends Bloc<AchievementsEvent, RequestState<GameAchievements>> {
  AchievementsBloc() : super(const RequestState.idle()) {
    on<FetchAchievements>(_mapEventToState);
  }
  final gameRepository = GamesService();

  void _mapEventToState(
      FetchAchievements event, Emitter<RequestState> emit) async {
    try {
      emit(const RequestState<GameAchievements>.loading());

      final response =
          await gameRepository.getAchievements(event.achievementId);
      emit(RequestState<GameAchievements>.success(response));
    } catch (e, s) {
      emit(RequestState<GameAchievements>.error(e, s));
    }
  }
}
