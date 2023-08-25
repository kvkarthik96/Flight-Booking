part of 'listing_bloc.dart';

sealed class ListingState extends Equatable {
  const ListingState();

  @override
  List<Object> get props => [];
}

abstract class ListingActionState extends ListingState {}

final class ListingInitial extends ListingState {}

class ListingLoadingState extends ListingState {}

class ListingLoadedState extends ListingState {
  final FlightModel response;

  const ListingLoadedState(this.response);
}

class ListingErrorState extends ListingState {}

class ActionInitialState extends ListingActionState {}

class NavigateToBookingState extends ListingActionState {
  final Flights flightData;

  NavigateToBookingState(this.flightData);
}
