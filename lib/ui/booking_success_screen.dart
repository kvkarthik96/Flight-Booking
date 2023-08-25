import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/res/image_const.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class BookingSuccessScreen extends StatefulWidget {
  const BookingSuccessScreen({super.key});

  @override
  State<BookingSuccessScreen> createState() => _BookingSuccessScreenState();
}

class _BookingSuccessScreenState extends State<BookingSuccessScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context)
        ..pop()
        ..pop()
        ..pop();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImageConst.successImage),
            AppWidgets.getDefaultSizedBox(height: 30),
            const LabelText(text: "Thank You.", size: 22),
            AppWidgets.getDefaultSizedBox(height: 20),
            const LabelText(
                text: "Your Flight Booking Done Successfully.",
                size: 18,
                fontWeight: FontWeight.w800),
          ],
        ),
      ),
    );
  }
}
