import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/repository/game_repo.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
import 'package:game_collections/presentation/ui/collection/collection_event.dart';
import 'package:game_collections/presentation/ui/collection/controller.dart';

// part 'games_bloc.freezed.dart';

class GameBloc extends Bloc<GameEvent, AllGamesState> {
  GameBloc() : super(AllGamesState(oldgames: Games())) {
    on<GameFetchEvent>(_mapEventToState);
  }

  final gameRepository = GamesService();

  int page = 1;

  void _mapEventToState(
      GameFetchEvent event, Emitter<AllGamesState> emit) async {
    try {
      emit(state.copyWith(status: AllGamesStatus.loading));
      final games = await gameRepository.getGames(state.pages);
      emit(state.copyWith(
          status: AllGamesStatus.success,
          games: games,
          pages: state.pages + 1));
    } catch (e) {
      emit(state.copyWith(status: AllGamesStatus.error));
    }

    // var currentState = state.copyWith(isLoading: true);

    // try {
    //   final games = await gameRepository.getGames(currentState.pages);
    //   currentState = state.copyWith(games: games, pages: state.pages + 1);

    //   print(games.count);

    //   print('loaded from here');
    // } catch (e) {
    //   state.copyWith(isLoading: false);
    //   throw e.toString();
    // }
    // try {
    //   if (state is GameLoadingState) {
    //     return;
    //   }
    //   // emit(const GameLoadingState);

    //   final res = await gameRepository.getGames(page);
    //   emit(GameSuccessState(games: res));
    //   page++;
    // } catch (e) {
    //   emit(GameErrorState(error: e.toString()));
    //   print(e.toString());

    //   // emit(RequestState<Games>.error(e.toString(), s));

    //   // print(e);
    // }
  }
}
