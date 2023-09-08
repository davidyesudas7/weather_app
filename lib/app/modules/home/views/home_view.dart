import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/utilities/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/city_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: kTextFieldInputDecoration,
                    onSubmitted: (value) {
                      controller.onSearch(value);
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Obx(
                      () => Row(
                        children: <Widget>[
                          Text(
                            '${controller.weatherdataclass.value.temprature}°',
                            style: kTempTextStyle,
                          ),
                          Text(
                            controller.weatherdataclass.value.weathericon,
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                    )),
                Obx(
                  () => Row(
                    children: [
                      WeatherEventCard(
                        weatherevent: 'Humidity',
                        eventdata:
                            '${controller.weatherdataclass.value.humidity}%',
                      ),
                      WeatherEventCard(
                        weatherevent: 'Wind Speed',
                        eventdata:
                            '${controller.weatherdataclass.value.windspeed} m/s',
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Obx(
                      () => Text(
                        '${controller.weatherdataclass.value.weathermessage} in ${controller.weatherdataclass.value.cityname}',
                        textAlign: TextAlign.right,
                        style: kMessageTextStyle,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Define the WeatherEventCard widget, which represents a card showing weather-related information.
class WeatherEventCard extends StatelessWidget {
  const WeatherEventCard({
    super.key,
    required this.weatherevent,
    required this.eventdata,
  });
  final String weatherevent;
  final String eventdata;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherevent,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            eventdata,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
