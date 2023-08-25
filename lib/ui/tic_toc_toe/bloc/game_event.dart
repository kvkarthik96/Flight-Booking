part of 'game_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GetInitialGameEvent extends GameEvent {
  final bool isTappedClearAll;
  final bool isTappedReset;
  final bool isEnteredValue;
  final bool isFetchFromPref;
  final int enteredIndex;

  const GetInitialGameEvent(
      {required this.isTappedClearAll,
      required this.isTappedReset,
      required this.isEnteredValue,
      required this.isFetchFromPref,
      required this.enteredIndex});
}
