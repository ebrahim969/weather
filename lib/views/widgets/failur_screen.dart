import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/views/widgets/text_widget.dart';

class FailurScreen extends StatelessWidget {
  const FailurScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
            ],
          ),
          SizedBox(height: Get.height * 0.4,),
          Center(child: textWidget(txt: "Something went wrong, please try again"),),
        ],
      ),
    );
  }
}

