import 'package:deep_byte/res/route_const.dart';
import 'package:deep_byte/routes/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deep_byte/routes/locator.dart';
import 'package:deep_byte/routes/routing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Center(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flight booking',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: routeDefault,
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: locator<NavigationService>().navigatorKey,
            home: child,
          ),
        );
      },
    );
  }
}
