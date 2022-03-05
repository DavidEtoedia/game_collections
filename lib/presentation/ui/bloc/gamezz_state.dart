part of 'gamezz_bloc.dart';

enum GamezzStatus { initial, success, failure }

class GamezzState extends Equatable {
  final List<Result> result;
  final String? errorMessage;
  final GamezzStatus status;
  final bool hasReachedMax;
  final bool isLoading;

  const GamezzState(
      {this.errorMessage,
      required this.result,
      required this.isLoading,
      required this.status,
      required this.hasReachedMax});

  factory GamezzState.initial() {
    return const GamezzState(
        result: [],
        status: GamezzStatus.initial,
        errorMessage: '',
        isLoading: false,
        hasReachedMax: false);
  }

  GamezzState copyWith(
      {GamezzStatus? status,
      String? errorMessage,
      bool? hasReachedMax,
      bool? isLoading,
      List<Result>? result}) {
    return GamezzState(
        status: status ?? this.status,
        result: result ?? this.result,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return '''GamezzState { status: $status, hasReachedMax: $hasReachedMax, result: ${result.length}, loading: $isLoading }''';
  }

  @override
  List<Object?> get props =>
      [hasReachedMax, status, result, errorMessage, isLoading];
}
