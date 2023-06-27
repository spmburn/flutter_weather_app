import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/config/fonts/custom_icons_icons.dart';
import 'package:flutter_template/config/theme/app_theme.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    List<TabItem> items = [
      TabItem(
        icon: CustomIcons.home,
        title: indexSelected == 0 ? 'Home' : null,
      ),
      TabItem(
        icon: CustomIcons.search,
        title: indexSelected == 1 ? 'Search' : null,
      ),
      TabItem(
        icon: CustomIcons.favorite,
        title: indexSelected == 2 ? 'Favarites' : null,
      ),
      TabItem(
        icon: CustomIcons.user,
        title: indexSelected == 3 ? 'Profile' : null,
      ),
    ];
    return BottomBarFloating(
      animated: true,
      duration: const Duration(microseconds: 2000),
      borderRadius: BorderRadius.circular(30),
      items: items,
      backgroundColor: AppTheme.cardWhite,
      color: AppTheme.textColorGray,
      colorSelected: AppTheme.textColorPink,
      paddingVertical: 20,
      indexSelected: indexSelected,
      onTap: (int index) => setState(() {
        indexSelected = index;
      }),
    );
  }
}
