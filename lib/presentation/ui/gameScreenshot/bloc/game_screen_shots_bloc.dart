import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_collections/Data/model/game_screenshots.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';

part 'game_screen_shots_event.dart';

class ScreenShotBloc
    extends Bloc<ScreenShotEvent, RequestState<GameScreenShots>> {
  ScreenShotBloc() : super(const RequestState.idle()) {
    on<GetScreenShot>(_mapEventToState);
  }

  final gameRepository = GamesService();

  void _mapEventToState(GetScreenShot event, Emitter<RequestState> emit) async {
    try {
      emit(const RequestState<GameScreenShots>.loading());
      final response = await gameRepository.getScreenShot(event.screenShotId);
      emit(RequestState<GameScreenShots>.success(response));
    } catch (e, s) {
      emit(RequestState<GameScreenShots>.error(e, s));
    }
  }
}
