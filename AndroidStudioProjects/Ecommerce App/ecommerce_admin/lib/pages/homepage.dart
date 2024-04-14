import 'package:ecommerce_admin/controller/home_controller.dart';
import 'package:ecommerce_admin/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.products[index].name ?? ''),
                subtitle:
                    Text("Price: ${(ctrl.products[index].price).toString()}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    ctrl.deleteProduct(ctrl.products[index].id ?? '');
                  },
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddProductPage());
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
