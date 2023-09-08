import 'package:get/get.dart';
import 'package:weather_app/app/data/weather.dart';

class HomeController extends GetxController {
  // Create an instance of WeatherModel for fetching weather data.
  WeatherModel weatherModel = WeatherModel();

  // Observables to store weather information.
  final RxInt temprature = 0.obs;
  final RxInt humidity = 0.obs;
  final RxString weathericon = ''.obs;
  final RxString weathermessage = ''.obs;
  final RxDouble windspeed = 0.0.obs;
  final RxString cityname = ''.obs;

  @override
  void onInit() async {
    // Fetch weather data for a default city (kochi) when the controller is initialized.
    final weatherdata = await weatherModel.getCityWeather('kochi');

    // Populate observables with weather data.
    temprature.value = weatherdata.main.temp.toInt();
    humidity.value = weatherdata.main.humidity;
    weathericon.value = weatherModel.getWeatherIcon(weatherdata.weather[0].id);
    weathermessage.value = weatherModel.getMessage(temprature.value);
    windspeed.value = weatherdata.wind.speed;
    cityname.value = weatherdata.name;

    super.onInit();
  }

  @override
  void onReady() {
    // Called when the controller is fully initialized and ready.
    super.onReady();
  }

  @override
  void onClose() {
    // Called when the controller is closed or removed.
    super.onClose();
  }

  // Function to fetch and update weather data for a specified city.
  void onSearch(String searchcityname) async {
    var weatherdata = await weatherModel.getCityWeather(searchcityname);

    // Update observables with the new weather data.
    temprature.value = weatherdata.main.temp.toInt();
    humidity.value = weatherdata.main.humidity;
    weathericon.value = weatherModel.getWeatherIcon(weatherdata.weather[0].id);
    weathermessage.value = weatherModel.getMessage(temprature.value);
    windspeed.value = weatherdata.wind.speed;
    cityname.value = weatherdata.name;
  }
}
