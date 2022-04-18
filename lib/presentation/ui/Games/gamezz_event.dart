part of 'gamezz_bloc.dart';

abstract class GamezzEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GamezzFetch extends GamezzEvent {}

class ScrollFetch extends GamezzEvent {
  final ScrollController scrollController;
  int scrollPage = 2;

  ScrollFetch(
    this.scrollController,
  );
  @override
  List<Object?> get props => [scrollController, scrollPage];
}
