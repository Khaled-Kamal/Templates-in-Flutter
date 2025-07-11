
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ranway/Pages/HomePage.dart';
import 'package:ranway/Widgets/animation_line.dart';
import 'package:svg_flutter/svg_flutter.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => Homepage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/image/Runwaytext.svg'),
            Gap(10),
            AnimationLine(),
          ],
        ),
      ),
    );
  }
}
