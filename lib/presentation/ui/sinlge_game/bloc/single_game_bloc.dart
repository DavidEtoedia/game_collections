import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';

part 'single_game_event.dart';

class SingleGameBloc extends Bloc<SingleGameEvent, RequestState<Games>> {
  SingleGameBloc() : super(const RequestState.idle()) {
    on<SingleGameEvent>(_mapEventToState);
  }

  final gamesRepository = GamesService();
  void _mapEventToState(event, emit) async {
    try {
      emit(const RequestState<Games>.loading());
      final response = await gamesRepository.getSingleGame();
      emit(RequestState<Games>.success(response));
    } on SocketException catch (e, s) {
      emit(RequestState.error(e, s));
    } catch (e, s) {
      emit(RequestState<Games>.error(e, s));
    }
  }
}
