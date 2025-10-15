import 'package:flutter/material.dart';
import 'package:furniture_shop/Pages/HomePage.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});



  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedIndex = 0;

  final List<Color> colors = [
    const Color(0xff607D7C),
    const Color(0xff5A5A5A),
    const Color(0xffFF3B30),
  ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 430,
            height: 400,
            decoration: BoxDecoration(color: Color(0xffE3E3E3)),

            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 75,
                  child: Image.asset('assets/modern_chair.png', width: 250),
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

          Gap(25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Modern Chair',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff304E3E),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    width: 45,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xffFFF0BA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Gap(5),
                        Icon(Icons.star, size: 12, color: Color(0xffF4BB00)),
                        Text('4.8', style: TextStyle(color: Color(0xffF4BB00))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Armchair',
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 18, color: Color(0xff8E8E8E)),
              ),
            ),
          ),

          Gap(15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text.rich(
              TextSpan(
                style: GoogleFonts.inter(
                  textStyle: TextStyle(fontSize: 15, color: Color(0xff828282)),
                ),
                children: [
                  TextSpan(
                    text:
                        'The simple and elegant shape makes it very \nsuitable for those for you who like those of you\nwho wants a minimalist room',
                  ),
                  TextSpan(
                    text: ' Read More',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff416954),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 53,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/one.png'),
                ),
                Gap(5),
                Container(
                  width: 53,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/2.png'),
                ),
                Gap(5),
                Container(
                  width: 53,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/3.png'),
                ),
              ],
            ),
          ),
          Gap(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff416954),
                  ),
                ),
                const SizedBox(width: 15),

                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Row(
                    children: List.generate(colors.length, (index) {
                      final isSelected = index == selectedIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? colors[index].withOpacity(0.6)
                                  : Colors.transparent,
                              width: isSelected ? 3 : 0,
                            ),
                          ),
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                Container(
                  width: 78,
                  height: 26,
                  decoration: BoxDecoration(
                    color: Color(0xffCDCBCB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 20,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Image.asset('assets/plus.png', width: 12),
                        ),

                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff416954),
                          ),
                        ),

                        Container(
                          width: 20,
                          height: 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Image.asset('assets/minus.png', width: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Gap(25),
          Center(
            child: Container(
              width: 370,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff2C4939),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add to card',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  Gap(10),
                  Image.asset('assets/Line 1.png' , height: 28,),
                  Gap(10),
                  Text(
                    '₹12,500',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,

                      fontSize: 16,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
