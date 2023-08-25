import 'package:deep_byte/ui/flight_home/flight_home_screen.dart';
import 'package:deep_byte/ui/tic_toc_toe/tic_toc_toe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deep_byte/res/image_const.dart';
import 'package:deep_byte/ui/main/bloc/main_bloc.dart';
import 'package:deep_byte/ui/main/custom_navigation.dart';
import 'package:deep_byte/ui/widgets/app_exit_alert.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';

class MainScreen extends StatefulWidget {
  final int? selectedIndex;
  const MainScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainBloc mainBloc = MainBloc();

  final List<String> itemTitle = ["Flight Booking", "Game"];
  final List<String> appbarTitle = ["Flight Booking", "Tic-toc-toe"];
  final List<String> iconList = [
    ImageConst.flightIconImage,
    ImageConst.gameIconImage
  ];

  final tab = const [FlightHomeScreen(), TicTocToeScreen()];
  bool interrupted = false;

  @override
  void initState() {
    super.initState();

    mainBloc.add(UpdateSelectedTabEvent(widget.selectedIndex ?? 0));
  }

  @override
  void dispose() {
    mainBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      bloc: mainBloc,
      builder: (context, state) {
        if (state is MainLoadedState) {
          return WillPopScope(
            onWillPop: () async {
              if (state.selectedTab == 0) {
                showAppExitAlert(context);
              } else {
                mainBloc.add(const UpdateSelectedTabEvent(0));
              }

              return false;
            },
            child: Scaffold(
                appBar: AppWidgets.appBarWidget(
                  isBackButton: false,
                  title: appbarTitle[state.selectedTab],
                  onPressed: () {},
                ),
                bottomNavigationBar: CustomBottomNavigationBar(
                    iconList: iconList,
                    iconTitle: itemTitle,
                    onChange: (val) async {
                      mainBloc.add(UpdateSelectedTabEvent(val));
                    },
                    selectedIndex: state.selectedTab),
                body: tab[state.selectedTab]),
          );
        } else {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Container(),
          );
        }
      },
    );
  }
}
