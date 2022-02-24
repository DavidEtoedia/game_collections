part of 'gamezz_bloc.dart';

abstract class GamezzEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GamezzFetch extends GamezzEvent {}
