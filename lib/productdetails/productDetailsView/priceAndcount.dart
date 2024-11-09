import 'package:flutter/material.dart';

import '../../AppColors.dart';

class PriceAndCountItems extends StatelessWidget {


  final String price;

  const PriceAndCountItems(
      {Key? key,
        required this.price,
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
              color: AppColor.primaryColor, fontSize: 30, height: 1.1),
        )
      ],
    );
  }
}