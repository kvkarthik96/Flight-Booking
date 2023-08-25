part of 'listing_bloc.dart';

sealed class ListingEvent extends Equatable {
  const ListingEvent();

  @override
  List<Object> get props => [];
}

class GetFlightListsEvent extends ListingEvent {
  final Map<String, dynamic> data;

  const GetFlightListsEvent(this.data);
}

class NavigateToBookingScreenEvent extends ListingEvent {
  final Flights flightData;
  const NavigateToBookingScreenEvent(this.flightData);
}
