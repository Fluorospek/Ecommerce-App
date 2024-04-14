import 'package:ecommerce_admin/controller/home_controller.dart';
import 'package:ecommerce_admin/pages/homepage.dart';
import 'package:ecommerce_admin/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await setup();
  //there are other ways of registering the getx controller, research about it
  Get.put(HomeController());
  runApp(const MyApp());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Ecommerce Admin',
      home: HomePage(),
    );
  }
}
