import 'package:ecommerce_admin/controller/home_controller.dart';
import 'package:ecommerce_admin/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add Product',
                  style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                ),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Product Name"),
                    hintText: "Enter Your Product Name",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productDescCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Description"),
                    hintText: "Enter Your Product Description",
                  ),
                  maxLines: 4,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productImageCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Image URL"),
                    hintText: "Enter Your Image URL",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Product Price"),
                    hintText: "Enter Product Price",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: DropdownBtn(
                        onSelected: (selectedValue) {
                          ctrl.category = selectedValue ?? "General";
                          ctrl.update();
                        },
                        selectedItemText: ctrl.category,
                        items: ['Boots', 'Shoes', 'Sandals', 'Flip Flops'],
                      ),
                    ),
                    Flexible(
                      child: DropdownBtn(
                        onSelected: (selectedValue) {
                          ctrl.brand = selectedValue ?? 'Un Branded';
                          ctrl.update();
                        },
                        selectedItemText: ctrl.brand,
                        items: ['Brand1'],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Offer Product?"),
                SizedBox(
                  height: 10,
                ),
                DropdownBtn(
                  onSelected: (selectedValue) {
                    ctrl.offer = selectedValue ?? 'False';
                    ctrl.update();
                  },
                  selectedItemText: ctrl.offer,
                  items: ['True', 'False'],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    ctrl.addproduct();
                  },
                  child: Text(
                    "Add Product",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
