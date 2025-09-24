import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/Onboarding_data.dart';
import 'Login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingDate.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Gap(100),
                    Image.asset(onboardingDate[index].image ,),
                    const Gap(24),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Text(
                        onboardingDate[index].title,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    onboardingDate.length,
                        (index) => Container(
                      margin: const EdgeInsets.only(right: 6),
                      height: 8,
                      width: _currentPage == index ? 20 : 15,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.red
                            : Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_currentPage == onboardingDate.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/Frame 4.png',
                    width: 79,
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
