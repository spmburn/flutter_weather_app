import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/presentation/providers/providers.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';

import '../delegates/search_delegate.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const AppLogo(),
        const Spacer(),
        IconButton(
          onPressed: () {
            final weatherRepository = ref.read(weatherRepositoryProvider);
            showSearch(
              context: context,
              delegate: SearchLocationDelegate(searchLocation: weatherRepository.searchLocation),
            );
          },
          icon: const Icon(
            CupertinoIcons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
