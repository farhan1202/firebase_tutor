import 'package:firebase_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_pass_controller.dart';

class ResetPassView extends GetView<ResetPassController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reset Password Page'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: controller.emailC,
                decoration: InputDecoration(hintText: "Email"),
              ),
              ElevatedButton(
                onPressed: () {
                  authC.resetPassword(controller.emailC!.text);
                },
                child: Text("Reset"),
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}
