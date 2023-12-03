import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hakkında:',
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
                color: Colors.cyanAccent[700],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bu pusula uygulaması, yön tayini ve navigasyon için tasarlanmış kullanıcı dostu bir araçtır. Doğru ve hassas pusula okuması ile konumunuzu belirlemek ve yönlerdeki değişiklikleri takip etmek artık daha kolay. Ayrıca, eğim sensörü sayesinde cihazınızın eğimini takip ederek yatay düzlemdeki hareketleri de gözlemleyebilirsiniz.',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                letterSpacing: .5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Yönler:',
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: .5,
                color: Colors.cyanAccent[700],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '- Kuzey (N) - Kuzey',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                letterSpacing: .5,
              ),
            ),
            Text(
              '- East (E) - Doğu',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                letterSpacing: .5,
              ),
            ),
            Text(
              '- South (S) - Güney',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                letterSpacing: .5,
              ),
            ),
            Text(
              '- West (W) - Batı',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                letterSpacing: .5,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: bottomTextWidget(),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      title: Text(
        "Uygulama Hakkında",
        style: GoogleFonts.montserrat(
          fontSize: 22.0,
          letterSpacing: .5,
          color: Colors.cyanAccent[700],
        ),
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color.fromARGB(255, 0, 184, 212),
        ),
      ),
      leadingWidth: 40.0,
      titleSpacing: 8.0,
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
