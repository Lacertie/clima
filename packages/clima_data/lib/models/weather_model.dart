import 'package:clima_domain/entities/weather.dart';
import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  const WeatherModel(this.weather);

  final Weather weather;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        Weather(
          temperature: (json['main']['temp'] as num).toDouble(),
          maxTemperature: (json['main']['temp_max'] as num).toDouble(),
          minTemperature: (json['main']['temp_min'] as num).toDouble(),
          tempFeel: (json['main']['feels_like'] as num).toDouble(),
          // We multiply by 3.6 to convert from m/s to km/h.
          windSpeed: (json['wind']['speed'] as num).toDouble() * 3.6,
          condition: json['weather'][0]['id'] as int,
          cityName: json['name'] as String,
          description: json['weather'][0]['description'] as String,
          date: DateTime.fromMillisecondsSinceEpoch((json['dt'] as int) * 1000),
          timeZoneOffset: Duration(seconds: json['timezone'] as int),
          iconCode: json['weather'][0]['icon'] as String,
          sunrise: json['sys']['sunrise'] as int,
          sunset: json['sys']['sunset'] as int,
          humidity: json['main']['humidity'] as int,
        ),
      );

  @override
  List<Object> get props => [weather];
}
