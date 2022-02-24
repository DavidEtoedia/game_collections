part of 'coll_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Result> gamez;

  PostsLoaded(this.gamez);
}

class PostsLoading extends PostsState {
  final List<Result> oldgames;
  final bool isFirstFetch;

  PostsLoading(this.oldgames, {this.isFirstFetch = false});
}
