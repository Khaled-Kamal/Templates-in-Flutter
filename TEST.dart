import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FoodCarousel extends StatefulWidget {
  const FoodCarousel({super.key});

  @override
  State<FoodCarousel> createState() => _FoodCarouselState();
}

class _FoodCarouselState extends State<FoodCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index, realIndex) {
            final food = foodList[index];
            final isActive = index == _currentIndex;

            return AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: isActive ? 1.0 : 0.85, // الكارد اللي في النص أكبر
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // الكارد
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                    padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 60),
                        Text(
                          food.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          food.category,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${food.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),

                  // الصورة الطالعة فوق الكارد
                  Positioned(
                    top: -50,
                    left: 30,
                    right: 30,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(food.image, fit: BoxFit.cover),
                      ),
                    ),
                  ),

                  // القلب ❤️
                  Positioned(
                    top: -10,
                    right: 20,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: isActive ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ),

                  // السهم في الأسفل
                  Positioned(
                    bottom: -25,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      child: const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            height: 380,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            viewportFraction: 0.6,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
