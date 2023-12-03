import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pusula/getx/compass_cntrl.dart';
import 'package:flutter_pusula/view/about_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  CompassController compassController = Get.put(CompassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Obx(
        () => Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                degreeTextWidget(),
                const SizedBox(height: 40.0),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    directionWidget(),
                    compassWidget(),
                    tiltTopWidget(),
                  ],
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: bottomTextWidget(),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      title: Text(
        "Pusula",
        style: GoogleFonts.montserrat(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          letterSpacing: .5,
          color: Colors.cyanAccent[700],
        ),
      ),
      actions: [
        Obx(() => IconButton(
              icon: Icon(
                compassController.isFlashOn.value
                    ? Icons.flashlight_on
                    : Icons.flashlight_off,
              ),
              tooltip: 'Işık',
              color: Colors.cyanAccent[700],
              onPressed: compassController.toggleFlashlight,
            )),
        IconButton(
          onPressed: () {
            Get.to(() => const AboutScreen());
          },
          icon: const Icon(Icons.info_outline),
          tooltip: 'Uygulama Hakkında',
          color: Colors.cyanAccent[700],
        ),
      ],
    );
  }

  Text degreeTextWidget() {
    return Text(
      "${compassController.degree.ceil() < 0 ? compassController.degree.ceil() + 360 : compassController.degree.ceil()} °",
      style: GoogleFonts.montserrat(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.red[700],
      ),
    );
  }

  Positioned directionWidget() {
    return Positioned(
      top: 0,
      child: Container(
        height: 80,
        width: 2.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.red[900],
        ),
      ),
    );
  }

  Transform compassWidget() {
    return Transform.rotate(
      angle: 2 * pi * (compassController.degree.value / 360),
      child: Image.asset(
        "assets/png/1200px-Compass_360_(en).png",
      ),
    );
  }

  Transform tiltTopWidget() {
    return Transform.translate(
      offset: Offset(
        compassController.tiltX.value.clamp(-45.0, 45.0),
        compassController.tiltY.value.clamp(-45.0, 45.0),
      ),
      child: Container(
        height: 18.0,
        width: 18.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.black38,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }

  Padding bottomTextWidget() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.copyright,
            size: 13.0,
          ),
          SizedBox(width: 5.0),
          Text(
            'Developed by ',
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            'Hüseyin ADIGÜZEL',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
