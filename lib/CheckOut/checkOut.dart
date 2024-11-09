import 'package:flutter/material.dart';

import '../AppColors.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        backgroundColor: Colors.grey[50],
        title: const Text('CheckOut',style: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
