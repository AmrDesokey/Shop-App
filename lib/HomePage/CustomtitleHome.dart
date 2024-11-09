import 'package:flutter/material.dart';

import '../AppColors.dart';
class CustomTitleHome extends StatelessWidget {
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
        style: const TextStyle(fontSize: 20,color: AppColor.primaryColor,
            fontWeight: FontWeight.bold),),
    );
  }
}
