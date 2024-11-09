import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.titleAppBar,
    this.onPressedIcon,
    this.onPressedSearch,}) : super(key: key);
  final String titleAppBar;
  final void Function()? onPressedIcon;

  final void Function()? onPressedSearch;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(icon: const Icon(Icons.search),
                  onPressed: onPressedSearch,),
                hintText: titleAppBar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
