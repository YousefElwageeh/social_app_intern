import 'package:get/get.dart';

/// returns a validator that validates emtpy for the given field name
String? Function(String?)? validateEmptyField(String fieldname) {
  return (String? value) {
    if (value!.isEmpty) {
      return "$fieldname Can't be Empty";
    }
    return null;
  };
}

String? validatePassword(String? password) {
  if (password!.isEmpty) {
    return "Password Can't be Empty";
  }
  if ((password.trim().length) < 6) {
    return "Password Can't be less than 6";
  }

  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword!.isEmpty) {
    return "Password Can't be Empty";
  }
  if (confirmPassword.trim() != password!.trim()) {
    return "Passwords don't match";
  }

  return null;
}

String? validateEmail(String? email) {
  if ((email?.trim().isEmpty ?? true) ||
      !GetUtils.isEmail(email?.trim() ?? "")) {
    return "Provide valid Email";
  }

  return null;
}

String? validateFullName(String? name) {
  name!.trim();
  List<String> fullName = name.split(' ');
  if (fullName.length < 2 || fullName.any((element) => element.isEmpty)) {
    return "Enter Full Name";
  }
  return null;
}

String? validatePlanAmount(String? amount) {
  if (amount!.isEmpty) {
    return "Amount Can't be Empty";
  }
  if (double.parse(amount) < 10) {
    return "Amount Can't be less than 10";
  }

  return null;
}

String? validatePhoneNoE164(String? value) {
  Pattern pattern = r'^\+?[1-9]\d{1,14}$';
  RegExp regex = RegExp(pattern.toString());
  if (!regex.hasMatch(value!)) {
    return 'Enter Valid Number';
  }
  return null;
}

String? validatePhoneNo(String? value) {
  Pattern pattern = r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[6789]\d{9}$';
  RegExp regex = RegExp(pattern.toString());
  if (!regex.hasMatch((value ?? "").trim())) {
    return 'Enter Valid Number';
  }
  return null;
}
