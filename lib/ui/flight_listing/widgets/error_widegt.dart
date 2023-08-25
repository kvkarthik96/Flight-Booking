import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:deep_byte/ui/widgets/error_widget.dart';
import 'package:flutter/material.dart';

class ListingErrorWidget extends StatelessWidget {
  const ListingErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppWidgets.appBarWidget(
          title: 'Flight Booking',
          onPressed: () {
            Navigator.pop(context);
          }),
      body: const ShowErrorWidget(),
    );
  }
}
