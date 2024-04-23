import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wtm_weather_app/Model/current.dart';
import 'package:wtm_weather_app/Model/units_model.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  factory WeatherResponse({
    required double latitude,
    required double longitude,
    required double elevation,
    required UnitsModel current_units,
    required Current current,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}
