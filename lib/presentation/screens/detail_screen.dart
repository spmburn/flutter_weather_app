import 'package:flutter/material.dart';
import 'package:flutter_template/config/fonts/custom_icons_icons.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../config/theme/app_theme.dart';

class DetailScren extends StatelessWidget {
  static const String name = 'detail_screen';
  const DetailScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: _SliverHeader(),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      'Today',
                      style: AppTheme.locationTextStyleMedium,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return const CardInfoHour();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // _WeekView(),
                ],
              ),
            ),
            SliverList.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: WeatherDayWidget(
                    day: 'Monday',
                    min: 13,
                    max: 20,
                    iconPath: 'assets/icons/cloud.png',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _WeekView extends StatelessWidget {
  // _WeekView({super.key});

  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: daysOfWeek.length,
          itemBuilder: (BuildContext context, int index) {
            final day = daysOfWeek[index];
            return WeatherDayWidget(
              day: day,
              min: 13,
              max: 20,
              iconPath: 'assets/icons/cloud.png',
            );
          },
        ),
      ),
    );
  }
}

double _minExtent = 320;
double _maxExtent = 320;

class _SliverHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(color: AppTheme.backgroundWhite),
        Positioned(
          right: 10,
          top: 0,
          child: Image.asset(
            'assets/images/sun_ cloud_rain.png',
            scale: 0.6,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: Image.asset('assets/icons/arrow_back.png'),
              ),
              const SizedBox(height: 30),
              Text(
                'Berlin, Germany'.replaceAll(',', ',\n'),
                style: AppTheme.locationTextStyleLarge,
              ),
              const TemperatureWidget(
                temperaure: 13,
                fontSize: 96.0,
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ChipTextIconInfo(
                  text: '6%',
                  color: AppTheme.textColorLightBlue,
                  iconData: CustomIcons.precipitation,
                ),
                ChipTextIconInfo(
                  text: '90%',
                  color: AppTheme.textColorLightBlue,
                  iconData: CustomIcons.humidity,
                ),
                ChipTextIconInfo(
                  text: '19km/h',
                  color: AppTheme.textColorPurple,
                  iconData: CustomIcons.wind,
                ),
              ])
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
