import 'package:deep_byte/data/model/flight_model.dart';
import 'package:deep_byte/ui/flight_booking/bloc/booking_bloc.dart';
import 'package:deep_byte/ui/flight_listing/widgets/flight_card_widget.dart';
import 'package:intl/intl.dart';
import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/res/route_const.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/utils/texts/text_field.dart';
import 'package:deep_byte/ui/utils/validator.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlightBookingScreen extends StatefulWidget {
  final Flights flightData;
  const FlightBookingScreen({super.key, required this.flightData});

  @override
  State<FlightBookingScreen> createState() => _FlightBookingScreenState();
}

class _FlightBookingScreenState extends State<FlightBookingScreen> {
  final nameKey = GlobalKey<FormFieldState>();
  final agekey = GlobalKey<FormFieldState>();
  final emailkey = GlobalKey<FormFieldState>();
  final mobilekey = GlobalKey<FormFieldState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobController = TextEditingController();
  final TextEditingController passNumController = TextEditingController();
  final TextEditingController passExpDateController = TextEditingController();
  final TextEditingController visaTypeController = TextEditingController();

  BookingBloc bookingBloc = BookingBloc();

  @override
  void dispose() {
    bookingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBloc, BookingState>(
      bloc: bookingBloc,
      listener: (context, state) {
        if (state is NavigateToSuccessScreenState) {
          Navigator.of(context).pushNamed(routeBookingSuccessScreen);
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppWidgets.appBarWidget(
              title: 'Flight Booking',
              onPressed: () {
                Navigator.pop(context);
              }),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.getDefaultSizedBox(),
                  FlightCardWidget(flight: widget.flightData),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  const LabelText(
                      text: 'Traveller Information',
                      size: 16,
                      fontWeight: FontWeight.bold),
                  AppWidgets.getDefaultSizedBox(height: 5),
                  const LabelText(
                      text: 'Name should be as on Goverment ID Prrof',
                      size: 14,
                      color: kTertiaryColor),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomTextField(
                    formKey: nameKey,
                    controller: nameController,
                    hintText: 'Name *',
                    keyboardType: TextInputType.name,
                    validator: validateName,
                  ),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomTextField(
                    formKey: agekey,
                    controller: ageController,
                    validator: validateAge,
                    hintText: 'Age *',
                    maxCharacters: 3,
                    keyboardType: TextInputType.number,
                  ),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomTextField(
                    formKey: emailkey,
                    controller: emailController,
                    hintText: 'Email *',
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmailId,
                  ),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomTextField(
                    formKey: mobilekey,
                    controller: mobController,
                    hintText: 'Mobile *',
                    keyboardType: TextInputType.phone,
                    maxCharacters: 10,
                    validator: validatePhone,
                  ),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomTextField(
                      controller: passNumController,
                      hintText: 'Passport Number'),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomTextField(
                    controller: passExpDateController,
                    hintText: 'Passport Expiry Date',
                    isReadOnly: true,
                    suffixIcon: const Icon(Icons.calendar_month),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2300),
                          builder: (BuildContext context, Widget? child) {
                            return child!;
                          });

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        passExpDateController.text = formattedDate;
                      }
                    },
                  ),
                  AppWidgets.getDefaultSizedBox(height: 15),
                  CustomTextField(
                      controller: visaTypeController, hintText: 'Visa Type'),
                  AppWidgets.getDefaultSizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 40),
                            backgroundColor: kPrimaryColor),
                        onPressed: () {
                          if (nameKey.currentState!.validate() &&
                              agekey.currentState!.validate() &&
                              emailkey.currentState!.validate() &&
                              mobilekey.currentState!.validate()) {
                            bookingBloc.add(NavigateToSuccessScreenEvent());
                          }
                        },
                        child: const LabelText(
                            text: "Continue to Pay",
                            color: kWhiteColor,
                            size: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
