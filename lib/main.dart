// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/search_page.dart';
void main() {
  runApp( BlocProvider(
      create: (context){
        return WeatherCubit(WeatherService());
      },
      child:WeatherApp()));
}

class WeatherApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SearchPage(),
    );
  }
}