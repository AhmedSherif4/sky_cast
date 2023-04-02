import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/application/dependency_injection.dart';
import 'package:sky_cast/features/weather/view_model/cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final TextEditingController _searchFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>.value(
      value: instance<WeatherCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('City Search')),
        body: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchFieldController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Put city\'s name',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                context
                    .read<WeatherCubit>()
                    .setSearchValue(_searchFieldController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
