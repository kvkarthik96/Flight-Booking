String? validatePlayerName(String? value) {
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please enter player name";
  } else if (value.length <= 2) {
    return "Name must be more than 2 characters";
  } else {
    return null;
  }
}

String? validateName(String? value) {
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please enter name";
  } else if (value.length <= 2) {
    return "Name must be more than 2 characters";
  } else {
    return null;
  }
}

String? validateEmailId(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please enter your email";
  } else if (!regex.hasMatch(value)) {
    return "Please enter valid email";
  } else {
    return null;
  }
}

String? validatePhone(String? value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regex = RegExp(pattern);
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please enter phone number";
  } else if (value.length != 10 || !regex.hasMatch(value)) {
    return "Please enter valid phone number";
  } else {
    return null;
  }
}

String? validateAge(String? value) {
  String pattern = r'(^[0-9]*$)';
  RegExp regex = RegExp(pattern);
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please enter age";
  } else if (!regex.hasMatch(value)) {
    return "Please enter valid age";
  } else {
    return null;
  }
}

String? validateDepartureFrom(String? value) {
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please select departure From";
  } else {
    return null;
  }
}

String? validateDepartureTo(String? value) {
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please select departure To";
  } else {
    return null;
  }
}

String? validateDepartureDate(String? value) {
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please select departure Date";
  } else {
    return null;
  }
}

String? validateClass(String? value) {
  value = value!.replaceAll(RegExp(' +'), ' ').trim();
  if (value.isEmpty) {
    return "Please select class";
  } else {
    return null;
  }
}
