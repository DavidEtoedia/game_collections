import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_collections/Data/model/creators.dart';
import 'package:game_collections/Data/services/game_service.dart';
import 'package:game_collections/controller/generic_state_notifier.dart';

part 'creators_event.dart';
// part 'creators_state.dart';
// part 'creators_bloc.freezed.dart';

class CreatorsBloc extends Bloc<CreatorEvent, RequestState<Creators>> {
  CreatorsBloc() : super(const RequestState.idle()) {
    on<CreatorEvent>(_mapEventToState);
  }

  final gameRepository = GamesService();

  void _mapEventToState(
      CreatorEvent event, Emitter<RequestState<Creators>> emit) async {
    try {
      emit(const RequestState<Creators>.loading());
      final response = await gameRepository.getCreators();
      emit(RequestState.success(response));
    } catch (e, s) {
      emit(RequestState<Creators>.error(e, s));
    }
  }
}
