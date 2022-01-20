// part of 'news_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_state_notifier.freezed.dart';

@freezed
class RequestState<T> with _$RequestState<T> {
  const factory RequestState.idle() = Idle<T>;

  const factory RequestState.loading() = Loading<T>;

  const factory RequestState.success(T? value) = Success<T>;

  const factory RequestState.error(Object error, StackTrace stackTrace) =
      Error<T>;
}
