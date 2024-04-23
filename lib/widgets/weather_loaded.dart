import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wtm_weather_app/Bloc/weather_bloc.dart';
import 'package:wtm_weather_app/Model/weather_response.dart';

import '../gen/assets.gen.dart';

class WeatherLoaded extends StatelessWidget {
  const WeatherLoaded({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WeatherResponse weatherResponse =
        context.read<WeatherBloc>().state.weatherResponse!;

    double temperature = weatherResponse.current.temperature_2m;
    String units = weatherResponse.current_units.temperature_2m;


    // WeatherResponse weatherResponse = context.read<WeatherBloc>().state.weatherResponse!;
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "in sync",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(DateFormat("EEE MMMM yyyy H:mm").format(DateTime.now()),
                ),
                // Text(weatherResponse.current.time),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${temperature}${units}",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                // Text("Friday, 25 December 2020"),

                // Assets.date.image(),
                SizedBox(
                  height: 30,
                ),
               weatherResponse.current.rain <= 0? Assets.sun.image(
                 height: 120,
                 width: 120
               ) : Assets.weather.image(),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.sunrie.image(),
                    SizedBox(
                      width: 10,
                    ),
                    // Text(
                    //   DateTime.now(),
                    //     // DateTime.now()
                    // ),
                    SizedBox(
                      width: 30,
                    ),
                    Assets.sunset.image(),
                    SizedBox(
                      width: 10,
                    ),
                    Text("6:32 PM")
                  ],
                )
                // Assets.sunrise.image(),
              ],
            ),
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
