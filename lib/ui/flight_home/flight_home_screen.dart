import 'package:deep_byte/res/color_const.dart';
import 'package:deep_byte/res/image_const.dart';
import 'package:deep_byte/res/route_const.dart';
import 'package:deep_byte/ui/flight_home/bloc/home_bloc.dart';
import 'package:deep_byte/ui/utils/bottomsheet/show_common_bottomsheet.dart';
import 'package:deep_byte/ui/utils/texts/label_text.dart';
import 'package:deep_byte/ui/utils/texts/text_field.dart';
import 'package:deep_byte/ui/utils/validator.dart';
import 'package:deep_byte/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FlightHomeScreen extends StatefulWidget {
  const FlightHomeScreen({super.key});

  @override
  State<FlightHomeScreen> createState() => _FlightListingScreenState();
}

class _FlightListingScreenState extends State<FlightHomeScreen> {
  final fromKey = GlobalKey<FormFieldState>();
  final toKey = GlobalKey<FormFieldState>();
  final dateKey = GlobalKey<FormFieldState>();

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  List<String> cities = [
    'Bengaluru',
    'Chennai',
    'Mumbai',
    'Delhi',
    'Kochi',
    'Hyderabad'
  ];

  List<String> classList = ['Economy', 'Business', 'Premium Business'];

  HomeBloc homeBloc = HomeBloc();

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is NavigateToFlightListingState) {
          Navigator.of(context)
              .pushNamed(routeFlightListingScreen, arguments: state.data);
        }
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.getDefaultSizedBox(height: 20),
                const LabelText(
                    text: 'Book your \nflight',
                    size: 33,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
                AppWidgets.getDefaultSizedBox(height: 20),
                CustomTextField(
                  formKey: fromKey,
                  controller: fromController,
                  hintText: 'DEPARTURE FROM *',
                  isReadOnly: true,
                  validator: validateDepartureFrom,
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down_sharp,
                  ),
                  onTap: () {
                    showCommonBottomSheet(
                        lists: cities,
                        selectedValue: fromController.text,
                        title: 'SELECT DEPARTURE FROM',
                        context: context,
                        onTap: (String sel) {
                          fromController.text = sel;
                          fromKey.currentState!.validate();
                          if (toController.text == sel) {
                            toController.text = '';
                          }
                          Navigator.pop(context);
                        });
                  },
                ),
                AppWidgets.getDefaultSizedBox(height: 20),
                CustomTextField(
                  formKey: toKey,
                  controller: toController,
                  hintText: 'DEPARTURE TO *',
                  validator: validateDepartureTo,
                  isReadOnly: true,
                  suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
                  onTap: () {
                    showCommonBottomSheet(
                        lists: cities,
                        selectedValue: toController.text,
                        title: 'SELECT DEPARTURE FROM',
                        context: context,
                        onTap: (String sel) {
                          toController.text = sel;
                          toKey.currentState!.validate();
                          if (fromController.text == sel) {
                            fromController.text = '';
                          }

                          Navigator.pop(context);
                        });
                  },
                ),
                AppWidgets.getDefaultSizedBox(height: 20),
                CustomTextField(
                  formKey: dateKey,
                  controller: dateController,
                  hintText: 'DEPARTURE DATE *',
                  validator: validateDepartureDate,
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

                      dateController.text = formattedDate;
                      dateKey.currentState!.validate();
                    }
                  },
                ),
                AppWidgets.getDefaultSizedBox(height: 20),
                CustomTextField(
                  controller: classController,
                  isReadOnly: true,
                  hintText: 'CLASS',
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  onTap: () {
                    showCommonBottomSheet(
                        lists: classList,
                        selectedValue: classController.text,
                        title: 'SELECT CLASS',
                        context: context,
                        onTap: (String sel) {
                          classController.text = sel;
                          Navigator.pop(context);
                        });
                  },
                ),
                AppWidgets.getDefaultSizedBox(height: 15),
                CustomSearchTextField(
                  onTap: () {
                    if (fromKey.currentState!.validate() &&
                        toKey.currentState!.validate() &&
                        dateKey.currentState!.validate()) {
                      homeBloc.add(NavigateToFlightListingEvent({
                        'from': fromController.text,
                        'to': toController.text,
                        'date': dateController.text,
                        'class': classController.text
                      }));
                    }
                  },
                ),
                AppWidgets.getDefaultSizedBox(height: 15),
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(ImageConst.flightImage,
                        fit: BoxFit.fitWidth))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
