import 'package:flutter/material.dart';
import 'package:furniture_shop/Models/BestSellerModel.dart';
import 'package:furniture_shop/Models/ChairsModel.dart';
import 'package:furniture_shop/Pages/ProductDetails.dart';
import 'package:furniture_shop/Widgets/CustomCard.dart';
import 'package:furniture_shop/Widgets/CustomCardRow.dart';
import 'package:furniture_shop/Widgets/CustomCategories.dart';
import 'package:furniture_shop/Widgets/CustomText.dart';
import 'package:furniture_shop/Widgets/Search.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

List<String> categories = ['Chairs', 'Cupboard', 'Tables', 'Lamps'];

class _HomepageState extends State<Homepage> {
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Discover The Best\nFurniture.',
              size: 20,
              fontWeight: FontWeight.w600,
            ),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset('assets/profile.png', fit: BoxFit.contain),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Search(),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: CustomText(
                text: 'Categories',
                size: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gap(20),
            CustomCategories(),
            Gap(30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 330,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: chairs.length,
                  separatorBuilder: (_, __) => Gap(15),
                  itemBuilder: (context, index) {
                    final item = chairs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => ProductDetails()),
                        );
                      },
                      child: CustomCard(
                        image: item.image,
                        rate: item.rate,
                        name: item.title,
                        sub: item.subtitle,
                        price: item.rice,
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Best Seller',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff416954),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 130,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestSeller.length,
                  separatorBuilder: (_, __) => Gap(8),
                  itemBuilder: (context, index) {
                    final item = bestSeller[index];
                    return CustomCardRow(
                      image: item.image,
                      rate: item.rate,
                      text: item.title,
                      sub: item.subtitle,
                      price: item.price,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
