import 'package:ecommerce_client/controller/login_controller.dart';
import 'package:ecommerce_client/pages/register_page.dart';
import 'package:ecommerce_client/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await setup();
  Get.put(LoginController());
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
      title: 'Ecommerce Client',
      home: RegisterPage(),
    );
  }
}
