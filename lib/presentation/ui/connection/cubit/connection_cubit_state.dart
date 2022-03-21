part of 'connection_cubit_cubit.dart';

@immutable
abstract class ConnectionState {
  const ConnectionState();
}

class ConnectionInitial extends ConnectionState {
  const ConnectionInitial();
}

class ConnectionSuccess extends ConnectionState {
  final String message;
  const ConnectionSuccess(this.message);
}

class ConnectionFailure extends ConnectionState {
  final String message;
  const ConnectionFailure(this.message);
}
