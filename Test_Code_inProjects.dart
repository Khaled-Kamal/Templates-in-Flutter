import 'package:flutter/material.dart';
import 'package:furniture_shop/Pages/HomePage.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Color(0xffE3E3E3),

        automaticallyImplyLeading: false,

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => Homepage()),
                  );
                },
                child: Image.asset('assets/arrow_back.png', width: 52),
              ),
              Image.asset('assets/heartAppBar.png', width: 52),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 430,
            height: 475,
            decoration: BoxDecoration(color: Color(0xffE3E3E3)),

            child: Stack(
              children: [
                Positioned(
                  top: 44,
                  left: 65,
                  child: Image.asset('assets/modern_chair.png', width: 280),
                ),

                Positioned(
                  bottom: 85,
                  left: 45,
                  child: Image.asset('assets/circle.png', width: 320),
                ),

                Positioned(
                  bottom: 74,
                  left: 195,
                  child: Container(
                    width: 28,
                    height: 26,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/arrow-expand.png', width: 24),
                  ),
                ),

                Positioned(
                  bottom: 48,
                  left: 195,
                  child: Text(
                    '360°',
                    style: TextStyle(fontSize: 15, color: Color(0xff416954)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
