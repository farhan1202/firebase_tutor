import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  TextEditingController? emailC;
  TextEditingController? passC;

  @override
  void onInit() {
    emailC = TextEditingController(text: "hafifi@gmail.com");
    passC = TextEditingController(text: "123123");
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    emailC!.dispose();
    passC!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
