import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/views/widgets/text_widget.dart';
import '../../cubits/weather_cubit/weather_cubit.dart';
import '../../models/weather_model.dart';

class WaetherDetails extends StatelessWidget {
  const WaetherDetails({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     weatherData!.getColor(),
          //     weatherData!.getColor()[300]!,
          //     weatherData!.getColor()[200]!,
          // ],
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter
          // ),
          ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.2),
                  const Icon(
                    Icons.location_on,
                    color: Colors.blueAccent,
                  ),
                  textWidget(txt: BlocProvider.of<WeatherCubit>(context).cityName!),
                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              textWidget(
                  txt: "Today's Report",
                  fontsize: 25,
                  fontWeight: FontWeight.w800),
              SizedBox(
                height: Get.height * 0.07,
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      weatherData!.getImage(),
                      height: 150,
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    textWidget(
                        txt: weatherData!.cityNameState,
                        fontsize: 20,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    textWidget(
                        txt: '${weatherData!.temp.toInt()}',
                        fontsize: 40,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      textWidget(
                          txt: "Max temp",
                          color: Colors.orange,
                          fontsize: 15),
                      textWidget(txt: "${weatherData!.maxTemp.toInt()}"),
                    ],
                  ),
                  Column(
                    children: [
                      textWidget(
                          txt: "Min temp",
                          color: Colors.orange,
                          fontsize: 15),
                      textWidget(txt: "${weatherData!.minTemp.toInt()}"),
                    ],
                  ),
                  Column(
                    children: [
                      textWidget(
                          txt: "Updated", color: Colors.orange, fontsize: 15),
                      textWidget(
                          txt:
                              "${weatherData!.date.hour} :${weatherData!.date.minute}"),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
