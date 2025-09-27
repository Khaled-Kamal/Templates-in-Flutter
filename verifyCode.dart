import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verifypage extends StatefulWidget {
  const Verifypage({super.key});

  @override
  State<Verifypage> createState() => _VerifypageState();
}

class _VerifypageState extends State<Verifypage> {
  final TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int secondsRemaining = 30;
  bool enableResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer({int seconds = 30}) {
    // لو فيه مؤقت سابق نلغيه
    _timer?.cancel();

    setState(() {
      secondsRemaining = seconds;
      enableResend = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return; // تأكد إن الـ State موجود قبل عمل setState
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
        _timer?.cancel(); // أوقف المؤقت
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();         // أوقف المؤقت لو لسه شغال
    otpController.dispose();  // فرّغ الكنترولر
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              "Verify Code",
              style: GoogleFonts.fredoka(
                textStyle:
                const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            // Description
            Text.rich(
              TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                children: [
                  const TextSpan(
                      text:
                      "We will send you a message to your SMS and email, if something goes wrong, please contact us. "),
                  TextSpan(
                    text: "Help",
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // OTP Fields (pin_code_fields)
            PinCodeTextField(
              appContext: context,
              length: 4,
              controller: otpController,
              onChanged: (value) {},
              cursorColor: Colors.black,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Colors.grey[200],
                inactiveFillColor: Colors.grey[200],
                selectedFillColor: Colors.grey[300],
                inactiveColor: Colors.grey,
                activeColor: Colors.black,
                selectedColor: Colors.red,
              ),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            // Resend text + timer
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (enableResend) {
                        // هنا ممكن تنادي API لإعادة إرسال الكود
                        // وبعدها تعيد تشغيل المؤقت:
                        startTimer(seconds: 30);
                      }
                    },
                    child: Text.rich(
                      TextSpan(
                        style: GoogleFonts.poppins(fontSize: 13),
                        children: [
                          const TextSpan(
                            text: "Didn't receive any code? ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Resend Again",
                            style: TextStyle(
                              color: const Color(0xffFF3951),
                              fontWeight:
                              enableResend ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    enableResend
                        ? "You can request a new code now"
                        : "Request a new code in 00:${secondsRemaining.toString().padLeft(2, '0')}s",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Done Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  print("Code entered: ${otpController.text}");
                },
                child: Text(
                  "Done",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
