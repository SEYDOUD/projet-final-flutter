import 'package:finalflutterproject/Models/meteo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';





class MeteoApi {
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static const String _apiKey = 'f7e91e1b8c3f702ccd0e6e675de33888';

  static Future<Meteo> fetchWeather(String cityName) async {
    final response = await Dio().get(_baseUrl, queryParameters: {
      'q': cityName,
      'appid': _apiKey,
      'units': 'metric',
    });

    if (response.statusCode == 200) {
      return Meteo.fromJson(response.data);
    } else {
      Get.snackbar(
        'Erreur',
        'Erreur: ${response.statusCode}',
        snackPosition: SnackPosition.TOP,
      );
      throw Exception('Erreur: ${response.statusCode}');
    }


  }
}