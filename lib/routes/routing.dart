import 'package:deep_byte/res/route_const.dart';
import 'package:deep_byte/ui/booking_success_screen.dart';
import 'package:deep_byte/ui/flight_booking/flight_booking_screen.dart';
import 'package:deep_byte/ui/flight_home/flight_home_screen.dart';
import 'package:deep_byte/ui/flight_listing/flight_listing_screen.dart';
import 'package:deep_byte/ui/launch_screen.dart';
import 'package:deep_byte/ui/main/main_screen.dart';
import 'package:deep_byte/ui/tic_toc_toe/tic_toc_toe.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? args;

    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case routeDefault:
        return MaterialPageRoute(builder: (_) => const LaunchScreen());

      case routeMainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case routeTicTocToeScreen:
        return MaterialPageRoute(builder: (_) => const TicTocToeScreen());

      case routeFlightHomeScreen:
        return MaterialPageRoute(builder: (_) => const FlightHomeScreen());

      case routeFlightListingScreen:
        if (args != null) {
          return MaterialPageRoute(
              builder: (_) => FlightListingScreen(data: args!));
        } else {
          return _errorRoute(settings.name);
        }

      case routeFlightBookingScreen:
        if (args != null) {
          return MaterialPageRoute(
              builder: (_) =>
                  FlightBookingScreen(flightData: args!['flightData']));
        } else {
          return _errorRoute(settings.name);
        }

      case routeBookingSuccessScreen:
        return MaterialPageRoute(builder: (_) => const BookingSuccessScreen());

      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(pageName) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.error_outline),
              AppWidgets.getDefaultSizedBox(),
              LabelText(
                text: errPageText + pageName.toString(),
                size: 16,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}
