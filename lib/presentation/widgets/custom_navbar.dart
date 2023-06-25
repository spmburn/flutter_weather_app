import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/fonts/custom_icons_icons.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
   int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    const List<TabItem> items = [
      TabItem(
        icon: CustomIcons.home,
        title: 'Home',
      ),
      TabItem(
        icon: CustomIcons.search,
        title: 'Search',
      ),
      TabItem(
        icon: CustomIcons.favorite,
        title: 'Favarites',
      ),
      
      TabItem(
        icon: CustomIcons.user,
        title: 'Profile',
      ),
    ];
    return BottomBarFloating(
      borderRadius: BorderRadius.circular(30),
      items: items,
      backgroundColor: Colors.white,
      color: Colors.blue,
      colorSelected: Colors.orange,
      indexSelected: indexSelected,
      paddingVertical: 24,
      onTap: (int index) => setState(() {
        indexSelected = index;
      }),
    );
  }
}
