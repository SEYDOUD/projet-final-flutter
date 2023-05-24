import 'dart:async';
import 'package:finalflutterproject/apis/apiWeather.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../Models/meteo.dart';


class MeteoController extends GetxController {
  var progress = 0.0.obs;
  var isLoading = true.obs;
  var counter = 0.obs;
  var messages = [
    "telechargement en cours...",
    "Veuillez patienter svp...",
    "on y est presque...",
    "un dernier effort...",
  ].obs;

  var meteoList = <Meteo>[].obs;

  late Timer _timer;
  late Timer _messageTimer;

  @override
  void onReady() {
    super.onReady();
    startLoading();
  }

  //important
  Future<void> loadData(String cityName) async {
    final meteo = await MeteoApi.fetchWeather(cityName);
    meteoList.add(meteo);

    progress.value = ((meteoList.length) * 100 / 5).toDouble();

    if (meteoList.length == 5) {
      _timer.cancel();
      isLoading.value = false;
    }
  }

  void startLoading() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      const cities = ["Bamako", "Dakar", "Russie", "Gambie", "Ziguenchor","Kolda"];
      loadData(cities[timer.tick - 1]);
    });

    _messageTimer = Timer.periodic(Duration(seconds: 6), (timer) {
      if (timer.tick >= 10) {
        _messageTimer.cancel();
      } else {
        counter.value = (counter.value + 1) % 3;
      }
    });

    Timer(Duration(seconds: 60), () {
      _timer.cancel();
      isLoading.value = false;
      _messageTimer.cancel();
    });
  }

  void reset() {
    _timer.cancel();
    _messageTimer.cancel();
    progress.value = 0.0;
    isLoading.value = true;
    counter.value = 0;
    meteoList.clear();
    startLoading();
  }
}
