part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class UpdateSelectedTabEvent extends MainEvent {
  final int selectedTab;

  const UpdateSelectedTabEvent(this.selectedTab);
}
