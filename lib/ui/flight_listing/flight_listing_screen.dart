import 'package:deep_byte/data/model/flight_model.dart';
import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/res/route_const.dart';
import 'package:deep_byte/ui/flight_listing/bloc/listing_bloc.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/utils/texts/text_field.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/error_widegt.dart';
import 'widgets/filter_display_widget.dart';
import 'widgets/flight_card_widget.dart';
import 'widgets/loading_widget.dart';

class FlightListingScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const FlightListingScreen({super.key, required this.data});

  @override
  State<FlightListingScreen> createState() => _FlightListingScreenState();
}

class _FlightListingScreenState extends State<FlightListingScreen> {
  ListingBloc listingBloc = ListingBloc();

  @override
  void initState() {
    listingBloc.add(GetFlightListsEvent(widget.data));
    super.initState();
  }

  @override
  void dispose() {
    listingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListingBloc, ListingState>(
      bloc: listingBloc,
      listenWhen: (previous, current) => current is ListingActionState,
      buildWhen: (previous, current) => current is! ListingActionState,
      listener: (context, state) {
        if (state is NavigateToBookingState) {
          Navigator.of(context).pushNamed(routeFlightBookingScreen,
              arguments: {'flightData': state.flightData});
        }
      },
      builder: (context, state) {
        if (state is ListingLoadingState) {
          return const ListingLoadingWidget();
        } else if (state is ListingLoadedState) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            appBar: AppWidgets.appBarWidget(
                title: 'Flight Booking',
                onPressed: () {
                  Navigator.pop(context);
                }),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomSearchTextField(onTap: () {
                    Navigator.of(context).pop();
                  }),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  FilterDisplayWidget(data: widget.data),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  const LabelText(
                      text: 'Flights:', size: 14, fontWeight: FontWeight.w600),
                  AppWidgets.getDefaultSizedBox(height: 10),
                  state.response.flights!.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                              itemCount: state.response.flights!.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10.h),
                              itemBuilder: (context, index) {
                                Flights flight = state.response.flights![index];
                                return InkWell(
                                  onTap: () {
                                    listingBloc.add(
                                        NavigateToBookingScreenEvent(flight));
                                  },
                                  child: FlightCardWidget(flight: flight),
                                );
                              }))
                      : const Center(
                          child:
                              LabelText(text: 'No Flights Available', size: 16),
                        )
                ],
              ),
            ),
          );
        } else {
          return const ListingErrorWidget();
        }
      },
    );
  }
}
