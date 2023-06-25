import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Material(
        color: AppTheme.cardPurple,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 40,
            ),
            child: Text(
              'VIEW STATS',
              style: AppTheme.buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
