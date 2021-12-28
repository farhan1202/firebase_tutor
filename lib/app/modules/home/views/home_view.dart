import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/app/controllers/auth_controller.dart';
import 'package:firebase_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                authC.logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body:
          // On time database
          // FutureBuilder<QuerySnapshot<Object?>>(
          //     future: controller.getData(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.done) {
          //         var dataDocs = snapshot.data!.docs;

          //         return ListView.builder(
          //           itemCount: dataDocs.length,
          //           itemBuilder: (context, i) => ListTile(
          //             title: Text(
          //                 "${(dataDocs[i].data() as Map<String, dynamic>)["name"]}"),
          //             subtitle: Text(
          //                 "Rp ${(dataDocs[i].data() as Map<String, dynamic>)["price"]}"),
          //           ),
          //         );
          //       }
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }),

          //Realtime database
          StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var dataDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: dataDocs.length,
              itemBuilder: (context, i) => ListTile(
                trailing: IconButton(
                    onPressed: () {
                      controller.deletData(dataDocs[i].id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                onTap: () =>
                    Get.toNamed(Routes.EDIT_PRODUCT, arguments: dataDocs[i].id),
                title: Text(
                    "${(dataDocs[i].data() as Map<String, dynamic>)["name"]}"),
                subtitle: Text(
                    "Rp ${(dataDocs[i].data() as Map<String, dynamic>)["price"]}"),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_PRODUCT);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
