import 'package:flutter/material.dart';

import '../../config/fonts/custom_icons_icons.dart';
import '../../config/theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        _Circle(hight: 40),
        _Circle(hight: 30),
        Icon(
          CustomIcons.applogo,
          color: AppTheme.textColorWhite,
        ),
      ],
    );
  }
}

class _Circle extends StatelessWidget {
  final double hight;
  const _Circle({
    required this.hight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: hight,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
    );
  }
}
