part of 'new_release_bloc.dart';

// @freezed
// class NewReleaseEvent with _$NewReleaseEvent {
//   const factory NewReleaseEvent.started() = _Started;
// }

abstract class NewReleaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewReleaseFetch extends NewReleaseEvent {}
