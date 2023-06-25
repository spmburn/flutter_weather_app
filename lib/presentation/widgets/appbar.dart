import 'package:flutter/material.dart';

import '../../config/fonts/custom_icons_icons.dart';
import '../../config/theme/app_theme.dart';
import 'widgets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppLogo(),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CustomIcons.filter,
            color: AppTheme.textColorWhite,
          ),
        ),
      ],
    );
  }
}
