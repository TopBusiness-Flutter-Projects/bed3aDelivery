import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bed3aDelivery/utill/dimensions.dart';

void showCustomSnackBar(String? message, {bool isError = true}) {
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin:  EdgeInsets.all(Dimensions.paddingSizeSmall),
    borderRadius: 10,
    isDismissible: true,
  ));
}