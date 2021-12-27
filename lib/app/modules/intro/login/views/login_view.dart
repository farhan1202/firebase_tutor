import 'package:firebase_app/app/controllers/auth_controller.dart';
import 'package:firebase_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LoginView'),
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
                  authC.login(
                    controller.emailC!.text,
                    controller.passC!.text,
                  );
                },
                child: Text("Login"),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum punya akun?"),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: Text("Daftar"))
                ],
              )
            ],
          ),
        ));
  }
}
