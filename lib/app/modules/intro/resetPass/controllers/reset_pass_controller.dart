import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController {
  //TODO: Implement ResetPassController

  TextEditingController? emailC;
  @override
  void onInit() {
    emailC = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    emailC!.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
