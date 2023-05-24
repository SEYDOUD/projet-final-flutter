import 'package:flutter/material.dart';

class Meteo {
  final String name;
  final double temperature;

  Meteo({required this.name, required this.temperature});

  factory Meteo.fromJson(Map<String, dynamic> json) {
    return Meteo(
      name: json['name'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
