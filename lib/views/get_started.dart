import 'package:flutter/material.dart';
import 'package:weather_app/views/search_page.dart';
import 'package:weather_app/views/widgets/text_widget.dart';
import 'package:get/get.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            // App image
            Image.asset(
              "assets/rainy.png",
              height: 150,
            ),
             SizedBox(
              height: Get.height * 0.08,
            ),
          
            // text to explain app
            textWidget(
                txt: "Discover the weather in your city",
                fontsize: 25,
                fontWeight: FontWeight.bold),
             SizedBox(
              height: Get.height * 0.03,
            ),
            textWidget(
                txt:
                    "Get to know your weather maps and radar precipitation forecast",
                fontsize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey[300]!),
             SizedBox(
              height: Get.height * 0.08,
            ),
          
            // get started buttom
            InkWell(
              onTap: () {
                Get.to(()=> SearchPage());
              },
              child: Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: textWidget(txt: "Get Started" ,fontsize: 16 , fontWeight: FontWeight.w500 )),
              ),
            ),
                  ],
                ),
          )),
    );
  }
}
