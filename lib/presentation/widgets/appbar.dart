import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';

import '../../config/fonts/custom_icons_icons.dart';
import '../../config/theme/app_theme.dart';
import '../screens/search_screen.dart';

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
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ));
          },
          icon: const Icon(
            CustomIcons.filter,
            color: AppTheme.textColorWhite,
          ),
        ),
      ],
    );
  }
}
