import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitialState()) {
    on<UpdateSelectedTabEvent>(updateSelectedTabEvent);
  }

  FutureOr<void> updateSelectedTabEvent(
      UpdateSelectedTabEvent event, Emitter<MainState> emit) {
    emit(MainInitialState());
    emit(MainLoadedState(event.selectedTab));
  }
}
