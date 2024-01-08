// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/widgets/text_widget.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class SearchPage extends StatefulWidget {

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    String? cityName;
    WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Padding(
          padding: const EdgeInsets.all(30),
             child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  textWidget(txt: "Search about your city weather" , fontsize: 25 , fontWeight: FontWeight.bold),
                  const SizedBox(height: 30,),
                 Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child:TextField(
                      onSubmitted: (data) {
                      cityName = data;
                      BlocProvider.of<WeatherCubit>(context).getWeatehr(cityName: cityName!);
                      BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                      Get.to(()=> HomePage());
                      },          
                      decoration:const InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Enter your city name",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10)
                      ),
                    ),
                  )
              ],
             ),
           ),
         ),
    );
  }
}

