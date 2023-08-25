class FlightModel {
  List<Flights>? flights;

  FlightModel({this.flights});

  FlightModel.fromMap(Map<String, dynamic> json) {
    if (json['flights'] != null) {
      flights = <Flights>[];
      json['flights'].forEach((v) {
        flights!.add(Flights.fromMap(v));
      });
    } else {
      flights = <Flights>[];
    }
  }
}

class Flights {
  String? flightImg;
  String? flightName;
  String? flightFrom;
  String? flightTo;
  String? flightFromDate;
  String? flightToDate;
  String? flightFromTime;
  String? flightToTime;
  String? flightDuration;
  String? flightStops;
  String? flightFare;

  Flights(
      {this.flightImg,
      this.flightName,
      this.flightFrom,
      this.flightTo,
      this.flightFromDate,
      this.flightToDate,
      this.flightFromTime,
      this.flightToTime,
      this.flightDuration,
      this.flightStops,
      this.flightFare});

  Flights.fromMap(Map<String, dynamic> json) {
    flightImg = json['flight_img'] ?? '';
    flightName = json['flight_name'] ?? '';
    flightFrom = json['flight_from'] ?? '';
    flightTo = json['flight_to'] ?? '';
    flightFromDate = json['flight_from_date'] ?? '';
    flightToDate = json['flight_to_date'] ?? '';
    flightFromTime = json['flight_from_time'] ?? '';
    flightToTime = json['flight_to_time'] ?? '';
    flightDuration = json['flight_duration'] ?? '';
    flightStops = json['flight_stops'] ?? '';
    flightFare = json['flight_fare'] ?? '';
  }
}
