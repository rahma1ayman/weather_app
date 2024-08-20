import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weatherModel.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModel.weatherCondition),
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: GoogleFonts.acme(
                  color: Colors.black,
                  fontSize: 36,
                ),
              ),
              Text(
                'Updated At ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network('https:${weatherModel.image}'),
                  Text(
                    weatherModel.temp.round().toString(),
                    style: GoogleFonts.acme(
                      color: Colors.black,
                      fontSize: 36,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Min Temp: ${weatherModel.minTemp.round()}',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Max Temp: ${weatherModel.maxTemp.round()}',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                weatherModel.weatherCondition,
                style: GoogleFonts.acme(
                  color: Colors.black,
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
