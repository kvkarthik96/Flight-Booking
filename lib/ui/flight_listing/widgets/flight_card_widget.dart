import 'package:deep_byte/data/model/flight_model.dart';
import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightCardWidget extends StatelessWidget {
  const FlightCardWidget({super.key, required this.flight});

  final Flights flight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 50.h,
              width: 50.h,
              child: Image.asset(flight.flightImg!, fit: BoxFit.cover)),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelText(
                  text: flight.flightName!,
                  size: 16,
                  fontWeight: FontWeight.bold),
              AppWidgets.getDefaultSizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        text: flight.flightFrom!,
                        size: 14,
                      ),
                      AppWidgets.getDefaultSizedBox(height: 3),
                      LabelText(
                        text: flight.flightFromTime!,
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      AppWidgets.getDefaultSizedBox(height: 3),
                      LabelText(
                          text: flight.flightFromDate!,
                          size: 12,
                          color: kTertiaryColor),
                    ],
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    children: [
                      LabelText(
                        text: flight.flightDuration!,
                        size: 14,
                      ),
                      SizedBox(
                        width: 75.w,
                        child: const Divider(
                          height: 2,
                          color: kBlackColor,
                        ),
                      ),
                      LabelText(
                        text: flight.flightStops!,
                        size: 14,
                      )
                    ],
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    children: [
                      LabelText(text: flight.flightTo!, size: 14),
                      AppWidgets.getDefaultSizedBox(height: 3),
                      LabelText(
                        text: flight.flightToTime!,
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      AppWidgets.getDefaultSizedBox(height: 3),
                      LabelText(
                        text: flight.flightToDate!,
                        size: 12,
                        color: kTertiaryColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      LabelText(
                        text: '₹ ${flight.flightFare}',
                        size: 16,
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
