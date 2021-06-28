part of 'connection_cubit.dart';

@immutable
abstract class ConnectionState {
  final ConnectivityResult _connectivityResult = ConnectivityResult.none;
}

class ConnectionLoading extends ConnectionState {}

class ConnectionData extends ConnectionState {}

class ConnectionWIFI extends ConnectionState {}

class ConnectionUnknown extends ConnectionState {}

class ConnectionNull extends ConnectionState {}
