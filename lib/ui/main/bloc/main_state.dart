part of 'main_bloc.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class MainInitialState extends MainState {}

final class MainLoadedState extends MainState {
  final int selectedTab;
  const MainLoadedState(this.selectedTab);
}
