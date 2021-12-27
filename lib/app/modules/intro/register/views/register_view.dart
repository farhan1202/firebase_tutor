import 'package:firebase_app/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RegisterView'),
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
              SizedBox(height: 10),
              TextField(
                controller: controller.passC,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  authC.signup(
                    controller.emailC!.text,
                    controller.passC!.text,
                  );
                },
                child: Text("Daftar"),
              ),
            ],
          ),
        ));
  }
}
