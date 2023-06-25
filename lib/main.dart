import 'dart:io';
import 'dart:ui';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/router/app_router.dart';
import 'config/theme/app_theme.dart';

void main() {
  if (Platform.isAndroid || Platform.isIOS) {
    runApp(
      const ProviderScope(child: MyApp()),
    );
  }

  // with extra config for device preview
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      tools: [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(
          onScreenshot: screenshotAsFiles(Directory('/home/saul/Pictures/')),
        ),
      ],
      builder: (context) => const ProviderScope(child: MyAppPreview()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.getTheme(),
      title: 'Material App',
    );
  }
}

class MyAppPreview extends StatelessWidget {
  const MyAppPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior:
          const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse}),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Material App',
      theme: AppTheme.getTheme(),
    );
  }
}
