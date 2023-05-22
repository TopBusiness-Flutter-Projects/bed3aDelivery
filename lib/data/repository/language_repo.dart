import 'package:flutter/material.dart';
import 'package:bed3aDelivery/data/model/response/language_model.dart';
import 'package:bed3aDelivery/utill/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return AppConstants.languages;
  }
}
