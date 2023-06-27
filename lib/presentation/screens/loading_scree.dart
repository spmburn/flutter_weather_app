import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.backgroundMagenta,
              AppTheme.backgroundLightGrey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      ),
    );
  }
}
