import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/repository/game_repo.dart';

part 'new_state.dart';

class CollectionsCubit extends Cubit<PostsState> {
  CollectionsCubit(this.gamesRepository) : super(PostsInitial());

  final GamesRepository gamesRepository;

  int page = 1;

  void loadData() async {
    if (state is PostsLoading) return;

    final currentState = state;

    var oldPosts = <Result>[];
    if (currentState is PostsLoaded) {
      // print('${currentState.gamez.length}');
      oldPosts = currentState.gamez;
    }

    emit(PostsLoading(oldPosts, isFirstFetch: page == 1));

    gamesRepository.getGames(page).then((newPosts) {
      page++;

      final posts = (state as PostsLoading).oldgames;
      posts.addAll(newPosts.results!);

      emit(PostsLoaded(posts));
    });
    // try {
    //   final currentState = state;
    //   var oldPosts = Games();
    //   if (currentState.status.isSuccess) {
    //     oldPosts = currentState.games;
    //   }

    //   emit(state.copyWith(status: AllGamesStatus.loading));
    //   final games = await gamesRepository.getGames(state.pages);
    //   emit(state.copyWith(
    //       status: AllGamesStatus.success, games: games, pages: page++));
    // } catch (e) {
    //   emit(state.copyWith(status: AllGamesStatus.error));
    // }

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

  // void handleScrollWithIndex(int index, ScrollController scrollController) {
  //   final itemPosition = index + 1;
  //   final requestMoreData = itemPosition % 10 == 0 && itemPosition != 0;
  //   final pageToRequest = itemPosition ~/ 10;

  //   scrollController.addListener(() {
  //     if (scrollController.position.atEdge) {
  //       if (requestMoreData && pageToRequest + 1 >= state.pages) {
  //         loadData();
  //       }
  //     }
  //   });
  // }

  // void setupScrollController(ScrollController _scrollController) {
  //   _scrollController.addListener(() {
  //     if (_scrollController.position.atEdge) {
  //       if (_scrollController.position.pixels != 0) {
  //         loadData();
  //       }
  //     }
  //   });
  // }
}
