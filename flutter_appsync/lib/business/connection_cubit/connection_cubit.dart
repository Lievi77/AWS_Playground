import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit() : super(ConnectionLoading());

  final Connectivity _connectivity = Connectivity(); //api access var

  //this method signalizes the cubit to start monitoring the connection.

  Future<void> checkConnection() async {
    ConnectivityResult res = await _connectivity.checkConnectivity();

    switch (res) {
      case ConnectivityResult.mobile:
        emit(ConnectionData());
        break;
      case ConnectivityResult.wifi:
        emit(ConnectionWIFI());
        break;
      case ConnectivityResult.none:
        emit(ConnectionNull());
        break;
      default:
        emit(ConnectionUnknown());
        break;
    }
  }
}
