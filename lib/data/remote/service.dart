import 'package:deep_byte/data/model/flight_model.dart';
import 'package:deep_byte/data/remote/dummy_data.dart';

class Service {
  Future<FlightModel> getFlightsData() async {
    return Future.delayed(const Duration(seconds: 1)).then((value) {
      return FlightModel.fromMap(flightListsData);
    });
  }
}
