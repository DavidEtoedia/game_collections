import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connection_cubit_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  late StreamSubscription internet;

  ConnectionCubit() : super(const ConnectionInitial()) {
    monitorInternetConnection();
  }

  StreamSubscription<InternetConnectionStatus> monitorInternetConnection() {
    return internet =
        InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });
  }

  @override
  Future<void> close() {
    internet.cancel();
    return super.close();
  }
}
