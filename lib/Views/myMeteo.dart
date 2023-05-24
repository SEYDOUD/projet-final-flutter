import 'dart:async';
import 'package:finalflutterproject/Widgets/cardList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../Controllers/meteoController.dart';
import '../Widgets/loadingWidget.dart';

class MeteoScreen extends StatefulWidget {
  const MeteoScreen({Key? key}) : super(key: key);

  @override
  _MeteoScreenState createState() => _MeteoScreenState();
}

class _MeteoScreenState extends State<MeteoScreen> {
  final MeteoController meteoController = Get.put(MeteoController());
  Timer? _timer;
  //creer des variable pour couleur
  Color morningColor = Colors.black;
  Color textColor = Colors.white;

  DateTime now = DateTime.now();

  String backgroundImage = "";



  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 11), (timer) {
      setState(() {});
    });
    backgroundImage = "assets/images/myMeteo.jpg";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: textColor,
        centerTitle: true,
        backgroundColor: morningColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.infinity,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                child: Obx(

                      () => Visibility(
                    visible: meteoController.isLoading.value,
                    child: Transform.scale(
                      scale: 1.5,
                      child: Image.asset("assets/images/chrono.png"),
                    ),
                  ),
                ),

              ),
              SizedBox(
                height: 50,
                child: Obx(

                      () => Visibility(
                    visible: !meteoController.isLoading.value,
                    child: Transform.scale(
                      scale: 1.5,
                      child: Image.asset("assets/images/succes.png"),
                    ),
                  ),
                ),

              ),

              Obx(() => Visibility(
                visible: meteoController.isLoading.value,
                child: const LoadingWidget(),
              )),

              Obx(() => Visibility(
                visible: meteoController.isLoading.value,
                child: Text(
                    meteoController.messages[meteoController.counter.value],
                    style:  TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: textColor,
                    )
                ),
              )),
              const SizedBox(height: 20),
              Obx(() => Visibility(
                visible: !meteoController.isLoading.value,
                child: ElevatedButton(
                  onPressed: meteoController.reset,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: textColor , backgroundColor: morningColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("restart"),
                  ),
                ),
              )),

              const SizedBox(height: 20),
              Obx(() =>Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meteoController.meteoList.length,
                  itemBuilder: (context, index) {
                    final meteo = meteoController.meteoList[index];
                    return MeteoCard(meteo: meteo);
                  },
                ),
              )),
              Obx(() =>Visibility(
                visible: !meteoController.isLoading.value,
                child: const SizedBox(height: 300),
              )),
              Obx(() =>Visibility(
                visible: meteoController.isLoading.value,
                child: const SizedBox(height: 100),
              )),

            ],
          ),
        ),
      ),
    );
  }
}
