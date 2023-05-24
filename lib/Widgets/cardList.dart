import 'package:finalflutterproject/Models/meteo.dart';
import 'package:flutter/material.dart';

class MeteoCard extends StatelessWidget {
  final Meteo meteo;


  const MeteoCard({Key? key, required this.meteo}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 1,

      child: Container(
        width: 150,
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white70, // Utilisation du dégradé de couleur comme arrière-plan
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              meteo.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${meteo.temperature} °C",
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Image.asset(
                      "assets/images/01d.png",
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
