part of 'purchased_games_bloc.dart';

enum PurchasedStatus { initial, success, failure }

class PurchasedGameState extends Equatable {
  final List<Result> result;
  final String? errorMessage;
  final PurchasedStatus status;
  final bool hasReachedMax;
  final bool isLoading;

  const PurchasedGameState(
      {this.errorMessage,
      required this.result,
      required this.isLoading,
      required this.status,
      required this.hasReachedMax});

  factory PurchasedGameState.initial() {
    return const PurchasedGameState(
        result: [],
        status: PurchasedStatus.initial,
        errorMessage: '',
        isLoading: false,
        hasReachedMax: false);
  }

  PurchasedGameState copyWith(
      {PurchasedStatus? status,
      String? errorMessage,
      bool? hasReachedMax,
      bool? isLoading,
      List<Result>? result}) {
    return PurchasedGameState(
        status: status ?? this.status,
        result: result ?? this.result,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return '''PurchasedGameState { status: $status, hasReachedMax: $hasReachedMax, result: ${result.length}, loading: $isLoading }''';
  }

  @override
  List<Object?> get props =>
      [hasReachedMax, status, result, errorMessage, isLoading];
}
