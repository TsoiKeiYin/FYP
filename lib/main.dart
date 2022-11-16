import 'package:flutter/material.dart';
import 'package:fyp_demo/base.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
    return const GetMaterialApp(
      title: 'FYP Demo',
      home: Base(),
      debugShowCheckedModeBanner: false,
    );
  }
}
