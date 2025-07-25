import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/components/Header.dart';
import 'package:open_fashion/components/custom_AppBar.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:svg_flutter/svg.dart';

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  final String image;
  final String name;
  final String description;
  final String price;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int quantity = 1;
  double basePrice = 0.0;

  @override
  void initState() {
    super.initState();
    basePrice = double.parse(widget.price.replaceAll('\$', ''));
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = basePrice * quantity;
    final estTotal = totalPrice; // Assuming no additional costs for simplicity

    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Column(
        children: [
          Gap(25),
          Header(Titie: 'CheckOut'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.image, width: 150, height: 170),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Text(
                    'lamerei'.toUpperCase(),
                    style: GoogleFonts.tenorSans(
                      textStyle: TextStyle(
                        letterSpacing: 5,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Gap(8),
                  Text(
                    widget.description.toUpperCase(),
                    style: GoogleFonts.tenorSans(
                      textStyle: TextStyle(
                        color: Color(0xff555555),
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Gap(8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: decrementQuantity,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Color(0xffc4c4c4)),
                          ),
                          child: Center(
                            child: SvgPicture.asset('assets/svgs/min.svg'),
                          ),
                        ),
                      ),
                      Gap(12),
                      Text(
                        '$quantity',
                        style: GoogleFonts.tenorSans(
                          textStyle: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Gap(12),
                      GestureDetector(
                        onTap: incrementQuantity,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Color(0xffc4c4c4)),
                          ),
                          child: Center(
                            child: SvgPicture.asset('assets/svgs/plus.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(12),
                  Text(
                    '\$${basePrice.toStringAsFixed(2)}',
                    style: GoogleFonts.tenorSans(
                      textStyle: TextStyle(
                        color: Color(0xffDD8560),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(10),
          Image.asset('assets/svgs/Line 22.png', width: 360),
          Gap(18),
          Padding(
            padding: const EdgeInsets.only(left: 64),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/promo.svg',
                  height: 24,
                  width: 24,
                ),
                Gap(10),
                Text(
                  'Add promo code'.toUpperCase(),
                  style: GoogleFonts.tenorSans(
                    textStyle: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Image.asset('assets/svgs/Line 22.png', width: 360),
          Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 64),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svgs/delivery.svg',
                  height: 29,
                  width: 29,
                ),
                Gap(10),
                Text(
                  'Delivery'.toUpperCase(),
                  style: GoogleFonts.tenorSans(
                    textStyle: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 55),
                  child: Text(
                    'Free'.toUpperCase(),
                    style: GoogleFonts.tenorSans(
                      textStyle: TextStyle(
                        color: Color(0xff333333),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Image.asset('assets/svgs/Line 22.png', width: 400),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Est. Total'.toUpperCase(),
                  style: GoogleFonts.tenorSans(
                    textStyle: TextStyle(
                      letterSpacing: 5,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  '\$${estTotal.toStringAsFixed(2)}',
                  style: GoogleFonts.tenorSans(
                    textStyle: TextStyle(
                      letterSpacing: 5,
                      color: Color(0xffDD8560),
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(30),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svgs/shopping bag.svg'),
                Gap(20),
                CustomText(text: 'Checkout'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
