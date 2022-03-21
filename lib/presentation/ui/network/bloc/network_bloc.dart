import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(const NetworkInitial()) {
    on<NetworkEvent>(_mapEventToState);
  }

  // late StreamSubscription internet;

  void _mapEventToState(NetworkEvent event, Emitter<NetworkState> emit) async {
    try {
      var internet =
          InternetConnectionChecker().onStatusChange.listen((status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            print('Data connection is available from internet.');
            break;
          case InternetConnectionStatus.disconnected:
            print('You are disconnected from the internet bloc.');
            break;
        }
      });
      await internet.cancel();
    } catch (e) {
      print(e);
    }
  }
}
