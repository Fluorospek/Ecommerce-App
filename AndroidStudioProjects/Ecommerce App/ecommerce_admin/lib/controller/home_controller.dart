import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = "Category";
  String brand = "Brand";
  String offer = "Offer?";

  List<Product> products = [];

  @override
  void onInit() {
    productCollection = firestore.collection('products');
    fetchProducts();
    super.onInit();
  }

  addproduct() {
    bool bool_offer = (offer == 'True') ? true : false;
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImageCtrl.text,
        offer: bool_offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product Added Successfully');
      setDefaultValues();
    } catch (e) {
      Get.snackbar('Failed', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  setDefaultValues() {
    productImageCtrl.clear();
    productPriceCtrl.clear();
    productDescCtrl.clear();
    productNameCtrl.clear();
    category = "Category";
    brand = "Brand";
    offer = "Offer?";
    update();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProds = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProds);
      Get.snackbar('Success', 'Products Fetched Successfully',
          colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }
}
