import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_checker_event.dart';

part 'internet_checker_state.dart';

class InternetCheckerBloc
    extends Bloc<InternetCheckerEvent, InternetCheckerState> {
  final Connectivity connectivity;
  StreamSubscription? checkConnection;

  InternetCheckerBloc({required this.connectivity})
      : super(InternetCheckerInitial()) {
    checkConnection =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        add(IsInternetAvailable(isAvailable: false));
      } else {
        add(IsInternetAvailable(isAvailable: true));
      }
    });
    on<IsInternetAvailable>((event, emit) {
      if (event.isAvailable == false) {
        emit(InternetNotConnected());
      } else {
        emit(InternetConnected());
      }
    });
  }

  @override
  Future<void> close() {
    checkConnection?.cancel();
    return super.close();
  }
}
