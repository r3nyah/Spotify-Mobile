import 'package:flutter/material.dart';
import 'package:mobilespotify/Src/Constant/Color.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> children;
  const BottomNavBar({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: black
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 30,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
