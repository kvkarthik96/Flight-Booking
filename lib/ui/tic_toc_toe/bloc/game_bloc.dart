import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final Future<SharedPreferences> preference = SharedPreferences.getInstance();

  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  List<String> matchedIndexes = [];

  bool oTurn = true;
  int oWins = 0;
  int xWins = 0;
  int filledBoxes = 0;
  String result = '';
  bool winnerFound = false;

  GameBloc() : super(GameInitialState()) {
    on<GetInitialGameEvent>(getInitialGameEvent);
  }

  Future<FutureOr<void>> getInitialGameEvent(
      GetInitialGameEvent event, Emitter<GameState> emit) async {
    emit(GameInitialState());

    Future<void> updateScore(String winner) async {
      if (winner == 'O') {
        oWins++;
      } else if (winner == 'X') {
        xWins++;
      }

      winnerFound = true;

      final SharedPreferences prefs = await preference;
      prefs.setInt('oWins', oWins);
      prefs.setInt('xWins', xWins);
      prefs.setStringList('matchedIndexes', matchedIndexes);
      prefs.setBool('winnerFound', winnerFound);
      prefs.setString('result', result);

      emit(ShowGameResultDailogState(true, result));
    }

    Future<void> checkWinner() async {
      // check 1st row
      if (displayXO[0] == displayXO[1] &&
          displayXO[0] == displayXO[2] &&
          displayXO[0] != '') {
        result = 'Player ${displayXO[0]} Wins!';
        matchedIndexes.addAll(['0', '1', '2']);
        updateScore(displayXO[0]);
      }

      // check 2nd row
      if (displayXO[3] == displayXO[4] &&
          displayXO[3] == displayXO[5] &&
          displayXO[3] != '') {
        result = 'Player ${displayXO[3]} Wins!';
        matchedIndexes.addAll(['3', '4', '5']);
        updateScore(displayXO[3]);
      }

      // check 3rd row
      if (displayXO[6] == displayXO[7] &&
          displayXO[6] == displayXO[8] &&
          displayXO[6] != '') {
        result = 'Player ${displayXO[6]} Wins!';
        matchedIndexes.addAll(['6', '7', '8']);
        updateScore(displayXO[6]);
      }

      // check 1st column
      if (displayXO[0] == displayXO[3] &&
          displayXO[0] == displayXO[6] &&
          displayXO[0] != '') {
        result = 'Player ${displayXO[0]} Wins!';
        matchedIndexes.addAll(['0', '3', '6']);
        updateScore(displayXO[0]);
      }

      // check 2nd column
      if (displayXO[1] == displayXO[4] &&
          displayXO[1] == displayXO[7] &&
          displayXO[1] != '') {
        result = 'Player ${displayXO[1]} Wins!';
        matchedIndexes.addAll(['1', '4', '7']);
        updateScore(displayXO[1]);
      }

      // check 3rd column
      if (displayXO[2] == displayXO[5] &&
          displayXO[2] == displayXO[8] &&
          displayXO[2] != '') {
        result = 'Player ${displayXO[2]} Wins!';
        matchedIndexes.addAll(['2', '5', '8']);
        updateScore(displayXO[2]);
      }

      // check diagonal
      if (displayXO[0] == displayXO[4] &&
          displayXO[0] == displayXO[8] &&
          displayXO[0] != '') {
        result = 'Player ${displayXO[0]} Wins!';
        matchedIndexes.addAll(['0', '4', '8']);
        updateScore(displayXO[0]);
      }

      // check diagonal
      if (displayXO[6] == displayXO[4] &&
          displayXO[6] == displayXO[2] &&
          displayXO[6] != '') {
        result = 'Player ${displayXO[6]} Wins!';
        matchedIndexes.addAll(['6', '4', '2']);
        updateScore(displayXO[6]);
      }
      if (!winnerFound && filledBoxes == 9) {
        result = 'Nobody Wins!';
        final SharedPreferences prefs = await preference;
        prefs.setString('result', result);
        emit(ShowGameResultDailogState(false, result));
      }
    }

    Future<void> tapped(int index) async {
      if (!winnerFound) {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBoxes++;
        } else if (!oTurn && displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBoxes++;
        }

        oTurn = !oTurn;

        checkWinner();

        final SharedPreferences prefs = await preference;
        prefs.setStringList('displayXO', displayXO);
      }
    }

    Future<void> clearBoard() async {
      winnerFound = false;
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      result = '';
      matchedIndexes = [];

      filledBoxes = 0;

      final SharedPreferences prefs = await preference;
      prefs.setStringList('displayXO', ['', '', '', '', '', '', '', '', '']);
      prefs.setStringList('matchedIndexes', []);
    }

    Future<void> resetAll() async {
      oTurn = true;
      displayXO = ['', '', '', '', '', '', '', '', ''];
      matchedIndexes = [];

      oWins = 0;
      xWins = 0;
      filledBoxes = 0;
      result = '';
      winnerFound = false;
      final SharedPreferences prefs = await preference;
      prefs.clear();
    }

    Future<void> getDataFromPref() async {
      final Future<SharedPreferences> preference =
          SharedPreferences.getInstance();
      final SharedPreferences prefs = await preference;
      oWins = prefs.getInt('oWins') ?? 0;
      xWins = prefs.getInt('xWins') ?? 0;

      winnerFound = prefs.getBool('winnerFound') ?? false;

      displayXO = prefs.getStringList('displayXO') ??
          ['', '', '', '', '', '', '', '', ''];
      matchedIndexes = prefs.getStringList('matchedIndexes') ?? [];
      result = prefs.getString('result') ?? '';
    }

    if (event.isTappedClearAll) {
      await clearBoard();
    }

    if (event.isTappedReset) {
      await resetAll();
    }

    if (event.isFetchFromPref) {
      await getDataFromPref();
    }

    if (event.isEnteredValue) {
      await tapped(event.enteredIndex);
    }

    emit(GameLoadedState(
        oWins: oWins,
        oTurn: oTurn,
        displayXO: displayXO,
        matchedIndexes: matchedIndexes,
        xWins: xWins,
        filledBoxes: filledBoxes,
        result: result,
        winnerFound: winnerFound));
  }
}
