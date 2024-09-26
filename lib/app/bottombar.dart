import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Bottombar extends StatelessWidget {
  final int index;
  const Bottombar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: const Color(0xffFF0022),
      color: Colors.white,
      items: const [
        TabItem(
          icon: Icons.home,
          title: 'Home',
        ),
        TabItem(icon: Icons.search, title: 'Search'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      initialActiveIndex: index,
      onTap: (int index) => routePage(index),
    );
  }
}
void routePage(int index) {
  if (index == 0) {
    Get.toNamed('/home');
  } else if (index == 1) {
    Get.toNamed('/search-screen');
  }
}