import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:deep_byte/ui/widgets/shimmer_loading_widget.dart';
import 'package:flutter/material.dart';

class ListingLoadingWidget extends StatelessWidget {
  const ListingLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppWidgets.appBarWidget(
          title: 'Flight Booking',
          onPressed: () {
            Navigator.pop(context);
          }),
      body: const ShimmerLoadingWidget(),
    );
  }
}
