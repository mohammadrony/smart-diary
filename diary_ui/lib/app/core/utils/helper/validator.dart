// matching various patterns for kinds of data
import 'package:get/get.dart';

class Validator {
  Validator();

  String? email(String? value) {
    var pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.email'.tr;
    } else {
      return null;
    }
  }

  String? password(String? value) {
    var pattern = r'^.{6,}$';
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.password'.tr;
    } else {
      return null;
    }
  }

  String? name(String? value) {
    var pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.name'.tr;
    } else {
      return null;
    }
  }

  String? number(String? value) {
    var pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.number'.tr;
    } else {
      return null;
    }
  }

  String? amount(String? value) {
    var pattern = r'^\d+$';
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.amount'.tr;
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    var pattern = r'^\S+$';
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.notEmpty'.tr;
    } else {
      return null;
    }
  }
}
