import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:stream_transform/stream_transform.dart';

part 'gamezz_event.dart';
part 'gamezz_state.dart';

const throttleDuration = Duration(milliseconds: 100);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class GamezzBloc extends Bloc<GamezzEvent, GamezzState> {
  GamezzBloc() : super(GamezzState.initial()) {
    on<GamezzFetch>(
      _onFetchGames,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final gameRepository = GamesService();
  int page = 2;

  Future<void> _onFetchGames(GamezzFetch event, emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(isLoading: true));

    try {
      if (state.status == GamezzStatus.initial) {
        final games = await gameRepository.getGames(page);
        return emit(state.copyWith(
            status: GamezzStatus.success,
            result: games.results,
            hasReachedMax: false));
      }

      if (state.status == GamezzStatus.success) {
        page++;
        final games = await gameRepository.getGames(page);
        games.results!.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: GamezzStatus.success,
                result: List.of(state.result)..addAll(games.results!.toList()),
                hasReachedMax: false,
              ));
      }
    } catch (e) {
      emit(state.copyWith(
          status: GamezzStatus.failure, errorMessage: e.toString()));
      emit(state.copyWith(isLoading: false));
      // print(e);
    }
  }
}
