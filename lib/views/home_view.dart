import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/no_weather_body.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody();
        } else {
          return Text("opps there was an error");
        }
      }),
    );
  }
}
 
// create states ضن 
// create cubit  ؟
// create function ؟ 
// provide cubit ؟
// integrate cubit ؟ 
// trigger cubit ؟


// cubit >> مهمته manage state 