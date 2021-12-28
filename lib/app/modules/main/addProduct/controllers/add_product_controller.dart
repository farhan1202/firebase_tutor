import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  //TODO: Implement AddProductController
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String name, String price) async {
    CollectionReference product = firestore.collection("product");

    await product.add({
      "name": name,
      "price": price,
    }).then((value) {
      // getMassage("Add Product");
      print("Product Added");
      Get.back();
    }).catchError((error) => print("Failed to add Product: $error"));
  }

  void getMassage(String msg) {
    Get.defaultDialog(title: "Success", middleText: msg);
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
