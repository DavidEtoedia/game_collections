import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_collections/Data/model/game_release.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_release_event.dart';
// part 'new_release_state.dart';

class NewReleaseBloc extends Bloc<NewReleaseEvent, RequestState<Games>> {
  NewReleaseBloc() : super(const RequestState.idle()) {
    on<NewReleaseEvent>(_mapEventToState);
  }

  final gameRepository = GamesService();

  void _mapEventToState(
      NewReleaseEvent event, Emitter<RequestState> emit) async {
    try {
      emit(const RequestState<Games>.loading());
      final response = await gameRepository.latestRelease();
      emit(RequestState<Games>.success(response));
    } catch (e, s) {
      emit(RequestState<Games>.error(e, s));
    }
  }
}


// class GamesBloc extends Bloc<GamesEvent, RequestState<Games>> {
//   GamesBloc() : super(const RequestState.idle()) {
//     on<GamesEvent>(_mapEventToState);
//   }

//   final gameRepository = GamesService();
//   final int page = 1;

//   void _mapEventToState(event, emit) async {
//     try {
//       emit(const RequestState<Games>.loading());
//       final res = await gameRepository.getGames(page);
//       emit(RequestState.success(res));
//     } catch (e, s) {
//       emit(RequestState<Games>.error(e.toString(), s));

//       // print(e);
//     }
//   }
// }