import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtm_weather_app/Bloc/weather_bloc.dart';
import 'package:wtm_weather_app/Bloc/weather_state.dart';
import 'package:wtm_weather_app/gen/assets.gen.dart';
import 'package:wtm_weather_app/pages/select_city_page.dart';
import 'package:wtm_weather_app/pages/settings_page.dart';

import '../widgets/weather_loaded.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    context.read<WeatherBloc>().fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    WeatherBloc bloc = context.watch<WeatherBloc>();
    WeatherState state = bloc.state;

    Widget uiToBeShown = Center(
      child: CircularProgressIndicator(),
    );

    switch(state.weatherStatus){


      case WeatherStatus.error:
        uiToBeShown = Center(child: Text("An Eroor Occured, check your internet connection"),);
      case WeatherStatus.successful:
        uiToBeShown = WeatherLoaded();
      default: break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Akure,Nigeria",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Current Location",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, SelectCityPage.route());
              },
              icon: Icon(Icons.map)),
          IconButton(
              onPressed: () {
                Navigator.push(context, SettingsPage.route());
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: uiToBeShown,
    );
  }
}


