// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/views/widgets/failur_screen.dart';
import 'package:weather_app/views/widgets/text_widget.dart';
import 'package:weather_app/views/widgets/weather_details.dart';
import '../cubits/weather_cubit/weather_cubit.dart';

class HomePage extends StatelessWidget {


  HomePage({super.key, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocBuilder<WeatherCubit, WeatherState>(builder:(context, state) {
        if(state is WeatherLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if(state is WeatherSuccess){
          return WaetherDetails(weatherData:state.weatherModel);
        }
        else if(state is WeatherFailuer){
          return const FailurScreen();
        }
        else{
          return Center(child: textWidget(txt: "Wating"),);
        }
      },)
    ));
  }
}

