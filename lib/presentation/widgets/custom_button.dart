import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Material(
        color: AppTheme.cardPurple,
        child: InkWell(
          onTap: onTap,
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
