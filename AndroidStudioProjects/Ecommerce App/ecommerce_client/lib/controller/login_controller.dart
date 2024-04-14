import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user/user.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerName = TextEditingController();
  TextEditingController registerPhone = TextEditingController();

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }

  addUser() {
    try {
      if (registerPhone.text.isEmpty || registerPhone.text.isEmpty) {
        Get.snackbar('Error', 'Please fill both the fields');
        return;
      }
      DocumentReference doc = userCollection.doc();
      User user = User(
        id: doc.id,
        name: registerName.text,
        phone: int.parse(registerPhone.text),
      );
      final userJson = user.toJson();
      doc.set(userJson);
      // Get.snackbar('Success', 'Product Added Successfully');
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
      print(e);
    }
  }
}
