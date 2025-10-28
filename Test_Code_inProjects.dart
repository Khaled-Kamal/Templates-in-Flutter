//////////////////// HomePage /////////////////////////////////////////


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watch_store/Models/watchesModel.dart';
import 'package:watch_store/Widgets/CustomCard.dart';
import 'package:watch_store/Widgets/Search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedIndex = 0;

List<String> categories = ['Smart watch', 'Casio', 'Tissot', 'Seiko'];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Image.asset('assets/filter.png', width: 30), Search()],
          ),
        ),
      ),

      body: Column(
        children: [
          Gap(18),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              'Find your suitable\nwatch now.',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          Gap(17),


        ],
      ),
    );
  }
}



//////////////////// Custom Card /////////////////////////////////////////


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.image,
    required this.tittle,
    required this.subtitle,
    required this.price,
  });

  final String image;
  final String tittle;
  final String subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset(image, width: 150),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              tittle,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              subtitle,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff9095A6),
                ),
              ),
            ),
          ),

          Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              '\$ $price',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xffF24E1E),
                ),
              ),
            ),
          ),
          Gap(20),
        ],
      ),
    );
  }
}
