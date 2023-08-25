part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class NavigateToFlightListingEvent extends HomeEvent {
  final Map<String, dynamic> data;

  const NavigateToFlightListingEvent(this.data);
}
