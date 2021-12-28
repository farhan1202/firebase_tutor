import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  //TODO: Implement EditProductController

  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference product = firestore.collection("product").doc(id);

    return product.get();
  }

  void editProduct(String name, String price, String id) async {
    DocumentReference product = firestore.collection("product").doc(id);

    await product.update({
      "name": name,
      "price": price,
    }).then((value) {
      // getMassage("Add Product");
      print("Product Update");
      Get.back();
    }).catchError((error) => print("Failed to update Product: $error"));
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
