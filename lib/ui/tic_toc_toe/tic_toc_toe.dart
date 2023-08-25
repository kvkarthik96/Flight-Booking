import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/ui/tic_toc_toe/bloc/game_bloc.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:deep_byte/ui/widgets/awsome_dailog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TicTocToeScreen extends StatefulWidget {
  const TicTocToeScreen({super.key});

  @override
  State<TicTocToeScreen> createState() => _TicTocToeScreenState();
}

class _TicTocToeScreenState extends State<TicTocToeScreen> {
  GameBloc gameBloc = GameBloc();

  @override
  void initState() {
    gameBloc.add(const GetInitialGameEvent(
        isEnteredValue: false,
        isFetchFromPref: true,
        isTappedClearAll: false,
        isTappedReset: false,
        enteredIndex: 0));

    super.initState();
  }

  @override
  void dispose() {
    gameBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      bloc: gameBloc,
      listenWhen: (previous, current) => current is ShowGameResultDailogState,
      listener: (context, state) {
        if (state is ShowGameResultDailogState) {
          showAwesomeDailog(
              context: context,
              isWinnerFound: state.isWinnerFound,
              resultText: state.resultText);
        }
      },
      builder: (context, state) {
        if (state is GameLoadedState) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppWidgets.getDefaultSizedBox(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const LabelText(
                                  text: 'Player 0',
                                  size: 16,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600),
                              AppWidgets.getDefaultSizedBox(height: 8),
                              LabelText(
                                  text: 'Win: ${state.oWins.toString()}',
                                  size: 18,
                                  fontWeight: FontWeight.w600)
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const LabelText(
                                  text: 'Player X',
                                  color: kPrimaryColor,
                                  size: 16,
                                  fontWeight: FontWeight.w600),
                              AppWidgets.getDefaultSizedBox(height: 8),
                              LabelText(
                                  text: 'Win: ${state.xWins.toString()}',
                                  size: 18,
                                  fontWeight: FontWeight.w600)
                            ]),
                      ]),
                  AppWidgets.getDefaultSizedBox(height: 20),
                  Expanded(
                      child: GridView.builder(
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                gameBloc.add(GetInitialGameEvent(
                                    isEnteredValue: true,
                                    isFetchFromPref: false,
                                    isTappedClearAll: false,
                                    isTappedReset: false,
                                    enteredIndex: index));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: state.matchedIndexes
                                            .contains(index.toString())
                                        ? kPrimaryColor.withOpacity(0.3)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 2,
                                        color: state.matchedIndexes
                                                .contains(index.toString())
                                            ? kPrimaryColor
                                            : kBlackColor),
                                  ),
                                  child: Center(
                                    child: Text(state.displayXO[index],
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: state.matchedIndexes
                                                    .contains(index.toString())
                                                ? kPrimaryColor
                                                : kBlackColor)),
                                  )),
                            );
                          })),
                  LabelText(
                      text: state.result == ""
                          ? state.oTurn
                              ? 'Player 0 Turn'
                              : 'Player X Turn'
                          : state.result,
                      size: 18,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                  AppWidgets.getDefaultSizedBox(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 40),
                            backgroundColor: kPrimaryColor),
                        onPressed: () {
                          gameBloc.add(const GetInitialGameEvent(
                              isEnteredValue: false,
                              isFetchFromPref: false,
                              isTappedClearAll: true,
                              isTappedReset: false,
                              enteredIndex: 0));
                        },
                        child: const LabelText(
                            text: "Restart Game",
                            color: kWhiteColor,
                            size: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  TextButton(
                      onPressed: () {
                        gameBloc.add(const GetInitialGameEvent(
                            isEnteredValue: false,
                            isFetchFromPref: false,
                            isTappedClearAll: false,
                            isTappedReset: true,
                            enteredIndex: 0));
                      },
                      child: const LabelText(
                        text: 'RESET ALL',
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Container(),
          );
        }
      },
    );
  }
}
