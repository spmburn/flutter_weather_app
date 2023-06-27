import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/config/constants/constants.dart';
import 'package:flutter_template/config/fonts/custom_icons_icons.dart';
import 'package:flutter_template/config/helpers/string_helper.dart';
import 'package:flutter_template/presentation/providers/weather_provider.dart';
import 'package:flutter_template/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../config/theme/app_theme.dart';
import '../../domain/entities/weather.dart';

class DetailScren extends ConsumerStatefulWidget {
  static const String name = 'detail_screen';
  final String location;
  const DetailScren({
    super.key,
    required this.location,
  });

  @override
  DetailScrenState createState() => DetailScrenState();
}

class DetailScrenState extends ConsumerState<DetailScren> {
  @override
  void initState() {
    super.initState();
    ref.read(forecastDayProvider(widget.location));
    ref.read(forecastWeekProvider(widget.location));
    ref.read(forecastCurrentProvider(widget.location));
  }

  @override
  Widget build(BuildContext context) {
    final forecastDayAsync = ref.watch(forecastDayProvider(widget.location));
    final forecastWeekAsync = ref.watch(forecastWeekProvider(widget.location));
    final forecastCurrentAsync = ref.read(forecastCurrentProvider(widget.location));

    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: _SliverHeader(
                forecast: forecastCurrentAsync.when(
                  loading: () => constantForecastCurrent,
                  error: (error, stackTrace) => constantForecastCurrent,
                  data: (forecast) => forecast,
                ),
              ),
            ),
            forecastDayAsync.when(
              error: (error, stackTrace) => SliverToBoxAdapter(child: Container()),
              loading: () => SliverToBoxAdapter(child: Container()),
              data: (forecast) => _Todayview(day: forecast.day),
            ),
            forecastWeekAsync.when(
              error: (error, stackTrace) => SliverToBoxAdapter(child: Container()),
              loading: () => SliverToBoxAdapter(child: Container()),
              data: (forecast) => SliverList.builder(
                itemCount: forecast.week.length,
                itemBuilder: (context, index) {
                  final weather = forecast.week[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: WeatherDayWidget(
                      day: StringHelper.getDayOfWeek(weather.date),
                      min: weather.mintempC ?? weather.tempC,
                      max: weather.tempC,
                      iconPath: weather.icon,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Todayview extends StatelessWidget {
  final List<Weather> day;
  const _Todayview({
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
              itemCount: day.length,
              itemBuilder: (BuildContext context, int index) {
                final Weather weather = day[index];
                return CardInfoHour(weather: weather);
              },
            ),
          ),
          const SizedBox(height: 10),
          // _WeekView(),
        ],
      ),
    );
  }
}

double _minExtent = 330;
double _maxExtent = 330;

class _SliverHeader extends SliverPersistentHeaderDelegate {
  final ForecastCurrent forecast;

  _SliverHeader({required this.forecast});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final location = "${forecast.location.name}, ${forecast.location.country}";
    final weather = forecast.current;
    return Stack(
      children: [
        Container(color: AppTheme.backgroundWhite),
        Positioned(
          right: 10,
          top: 0,
          child: FadeIn(
            // TODO: IMPLEMENT CUSTOM ICON
            child: Image.asset(
              'assets/images/sun_ cloud_rain.png',
              scale: 0.6,
            ),
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
              FadeInRight(
                child: Text(
                  location.replaceAll(',', '\n'),
                  style: AppTheme.locationTextStyleLarge,
                ),
              ),
              TemperatureWidget(
                temperaure: forecast.current.tempC,
                fontSize: 96.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChipTextIconInfo(
                    text: '${weather.precipMm}mm',
                    color: AppTheme.textColorLightBlue,
                    iconData: CustomIcons.precipitation,
                  ),
                  ChipTextIconInfo(
                    text: '${weather.humidity}%',
                    color: AppTheme.textColorLightBlue,
                    iconData: CustomIcons.humidity,
                  ),
                  ChipTextIconInfo(
                    text: '${weather.windKph}km/h',
                    color: AppTheme.textColorPurple,
                    iconData: CustomIcons.wind,
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
