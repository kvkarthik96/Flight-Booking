part of 'game_bloc.dart';

sealed class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

final class GameInitialState extends GameState {}

final class GameLoadedState extends GameState {
  final bool oTurn;
  final List<String> displayXO;
  final List<String> matchedIndexes;
  final int oWins;
  final int xWins;
  final int filledBoxes;
  final String result;
  final bool winnerFound;

  const GameLoadedState(
      {required this.oTurn,
      required this.displayXO,
      required this.matchedIndexes,
      required this.oWins,
      required this.xWins,
      required this.filledBoxes,
      required this.result,
      required this.winnerFound});
}

final class ShowGameResultDailogState extends GameState {
  final bool isWinnerFound;
  final String resultText;
  const ShowGameResultDailogState(this.isWinnerFound,this.resultText);
}
