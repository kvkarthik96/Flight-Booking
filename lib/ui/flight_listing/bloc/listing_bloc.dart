import 'dart:async';

import 'package:deep_byte/data/model/flight_model.dart';
import 'package:deep_byte/data/remote/service.dart';
import 'package:deep_byte/ui/utils/helper_util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc() : super(ListingInitial()) {
    on<GetFlightListsEvent>(getFlightListsEvent);

    on<NavigateToBookingScreenEvent>(navigateToBookingScreenEvent);
  }

  Future<FutureOr<void>> getFlightListsEvent(
      GetFlightListsEvent event, Emitter<ListingState> emit) async {
    Service service = Service();

    FlightModel response = FlightModel();

    List<Flights> flights = [];

    getFlightsData() async {
      await HelperUtil.checkInternetConnection().then((internet) async {
        if (internet) {
          await service.getFlightsData().then((respObj) {
            response = respObj;

            for (int i = 0; i < response.flights!.length; i++) {
              if ((event.data['from'].toLowerCase().contains(
                      response.flights![i].flightFrom!.toLowerCase())) &&
                  (event.data['to'].toLowerCase().contains(
                      response.flights![i].flightTo!.toLowerCase())) &&
                  (event.data['date'].toLowerCase().contains(
                      response.flights![i].flightFromDate!.toLowerCase()))) {
                flights.add(response.flights![i]);
              }
            }

            response.flights = flights;
          });
        }
      });
    }

    emit(ListingLoadingState());
    await getFlightsData();
    emit(ListingLoadedState(response));
  }

  FutureOr<void> navigateToBookingScreenEvent(
      NavigateToBookingScreenEvent event, Emitter<ListingState> emit) {
    emit(ActionInitialState());
    emit(NavigateToBookingState(event.flightData));
  }
}
