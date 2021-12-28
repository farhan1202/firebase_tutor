import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference product = firestore.collection("product");

    return product.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference product = firestore.collection("product");
    return product.snapshots();
  }

  void deletData(String id) {
    DocumentReference docref = firestore.collection("product").doc(id);

    try {
      Get.defaultDialog(
        title: "Delete Product",
        middleText: "Apakah Ingin Menghapus?",
        textConfirm: "Yes",
        textCancel: "No",
        onConfirm: () async {
          await docref.delete();
          Get.back();
        },
        onCancel: () => Get.back(),
      );
    } catch (e) {
      print(e);
    }
  }
}
