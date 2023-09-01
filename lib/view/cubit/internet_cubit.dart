
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState>{
  final Connectivity connectivity;
 late StreamSubscription connectivityStreamSubscription;
  InternetCubit({required this.connectivity}):super(InternetLoading()){
    connectivityStreamSubscription=Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        if(ConnectivityResult == ConnectivityResult.wifi){
          emit(InternetConnected(connectionType: ConnectionType.wifi));
        }else if(ConnectivityResult == ConnectivityResult.mobile){
          emit(InternetConnected(connectionType: ConnectionType.mobile));
        }else if(ConnectivityResult == ConnectivityResult.none){
          emitInternetDisConnected();
        }
    });
  }

  void emitInternetConnected(ConnectionType _connectinType)=> emit(InternetConnected(connectionType: _connectinType));

  void emitInternetDisConnected()=> emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}