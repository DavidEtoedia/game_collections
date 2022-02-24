part of 'gamezz_bloc.dart';

enum GamezzStatus { initial, success, failure }

class GamezzState extends Equatable {
  // final Games? games;
  final List<Result> result;
  final int page;
  final GamezzStatus status;
  final bool hasReachedMax;
  // final bool isLoading;

  const GamezzState(
      {
      // this.games,
      this.page = 1,
      this.result = const <Result>[],
      // required this.isLoading,
      this.status = GamezzStatus.initial,
      this.hasReachedMax = false});

  // factory GamezzState.initial() {
  //   return const GamezzState(result: [], page: 1, isLoading: false);
  // }

  GamezzState copyWith(
      {GamezzStatus? status,
      Games? games,
      bool? hasReachedMax,
      int? page,
      bool? isLoading,
      List<Result>? result}) {
    return GamezzState(
        status: status ?? this.status,
        // games: games ?? this.games,
        result: result ?? this.result,
        // isLoading: isLoading ?? this.isLoading,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return '''GamezzState { status: $status, page: $page, hasReachedMax: $hasReachedMax, result: ${result.length} }''';
  }

  @override
  List<Object?> get props => [
        hasReachedMax,
        status,
        page,
        result,
      ];
}
