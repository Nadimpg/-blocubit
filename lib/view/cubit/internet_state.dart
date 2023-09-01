part of'internet_cubit.dart';



enum ConnectionType{
  mobile,
  wifi
}
abstract class InternetState{}

class InternetLoading extends InternetState{}

class InternetConnected extends InternetState{
   final ConnectionType connectionType;
   InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState{

}

