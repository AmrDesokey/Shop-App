import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'package:ok/Services/Services.dart';
 import 'package:ok/HomeScreen/homeScreen.dart';

import 'package:ok/RoutesController.dart';
import 'package:ok/SignUp/SignUp_view.dart';
import 'package:ok/signIn/SignInView.dart';
 

import 'ame.dart';
import 'bindings/initialBinding.dart';
 

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Graduation',
      initialBinding: InitialBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      getPages: routes,
    );
  }
}

