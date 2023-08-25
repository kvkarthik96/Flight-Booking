import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToFlightListingEvent>(navigateToFlightListingEvent);
  }

  FutureOr<void> navigateToFlightListingEvent(
      NavigateToFlightListingEvent event, Emitter<HomeState> emit) {
    emit(HomeInitial());
    emit(NavigateToFlightListingState(event.data));
  }
}
