import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDisplayWidget extends StatelessWidget {
  const FilterDisplayWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(10.h)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            LabelText(
                text: '${data['from']} - ${data['to']}',
                size: 18,
                fontWeight: FontWeight.bold),
            AppWidgets.getDefaultSizedBox(height: 8),
            LabelText(
                text: '${data['date']}, ${data['class']}',
                size: 14,
                color: kTertiaryColor,
                fontWeight: FontWeight.w600)
          ])
        ]));
  }
}
