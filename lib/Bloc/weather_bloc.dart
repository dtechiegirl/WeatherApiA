import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wtm_weather_app/Bloc/weather_state.dart';

import '../Model/weather_response.dart';

class WeatherBloc extends Cubit<WeatherState> {
  WeatherBloc() : super(WeatherState());
  void fetchWeather() async {
    emit(state.copyWith(weatherStatus: WeatherStatus.processing));
    try {
      var dio = Dio();
      String url =
          "https://api.open-meteo.com/v1/forecast?latitude=7.250771&longitude=5.210266&current=temperature_2m,rain,showers&timezone=auto&forecast_days=1";

      // "https://httpsapi.open-meteo.com/v1/forecast?latitude=7.4985&longitude=9.0563&current=temperature_2m,rain,showers&timezone=auto&forecast_days=1";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        // print(response.data);
        var weatherRes = WeatherResponse.fromJson(response.data);
        emit(state.copyWith(
            weatherResponse: weatherRes,
            weatherStatus: WeatherStatus.successful));
        // print(weatherRes);
      }
    } catch (e, s) {
      print(e);
      print(s);
      emit(state.copyWith(weatherStatus: WeatherStatus.error));
    }
  }
}
