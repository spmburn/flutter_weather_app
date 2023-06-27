import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/domain/entities/weather.dart';
import 'package:flutter_template/presentation/screens/detail_screen.dart';

typedef SearchLocationCallback = Future<List<Location>> Function(String query);

class SearchLocationDelegate extends SearchDelegate<Location?> {
  final SearchLocationCallback searchLocation;

  SearchLocationDelegate({
    required this.searchLocation,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () => query = '',
          icon: const Icon(
            Icons.clear_rounded,
            color: Colors.black,
          ),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return (query.isNotEmpty)
        ? FutureBuilder(
            future: searchLocation(query),
            // initialData: const <Location>[],
            builder: (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
              final locations = snapshot.data ?? [];

              return ListView.builder(
                itemCount: locations.length,
                itemBuilder: (BuildContext context, int index) {
                  final location = locations[index];
                  return ListTile(
                    title: Text(location.name),
                    subtitle: Text("${location.region}, ${location.country}"),
                    leading: const Icon(Icons.location_on),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScren(
                            location: "${location.name}, ${location.region}, ${location.country}",
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          )
        : Container();
  }
}
