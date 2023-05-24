import 'package:finalflutterproject/Controllers/meteoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MeteoController meteoController= Get.put(MeteoController());

    return Visibility(
      visible: meteoController.isLoading.value,
      child: Container(
        width: 250,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: meteoController.progress.value / 100,
              strokeWidth: 7,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.orange,
              ),
              backgroundColor: Colors.grey[300],
            ),
            Positioned(
              bottom: 20,
              child: Text(
                '${meteoController.progress.value.round()}%',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
