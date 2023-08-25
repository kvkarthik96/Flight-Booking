import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<NavigateToSuccessScreenEvent>(navigateToSuccessScreenEvent);
  }

  FutureOr<void> navigateToSuccessScreenEvent(
      NavigateToSuccessScreenEvent event, Emitter<BookingState> emit) {
    emit(NavigateToSuccessScreenState());
  }
}
