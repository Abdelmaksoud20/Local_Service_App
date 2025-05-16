import 'package:flutter_bloc/flutter_bloc.dart';

class Observer implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // Removed super call
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    // Removed super call
    print('onClose -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    // Removed super call
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // Removed super call
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // Removed super call
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // Removed super call
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }
}