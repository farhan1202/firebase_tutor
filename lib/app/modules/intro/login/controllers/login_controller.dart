import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  TextEditingController? emailC;
  TextEditingController? passC;
  @override
  void onInit() {
    emailC = TextEditingController(text: "hafifi1202@gmail.com");
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
