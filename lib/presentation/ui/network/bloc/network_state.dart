part of 'network_bloc.dart';

@immutable
abstract class NetworkState {
  const NetworkState();
}

class NetworkInitial extends NetworkState {
  const NetworkInitial();
}

class NetworkSuccess extends NetworkState {
  final String message;
  const NetworkSuccess(this.message);
}

class NetworkFailure extends NetworkState {
  final String message;
  const NetworkFailure(this.message);
}
