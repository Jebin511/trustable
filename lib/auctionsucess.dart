import 'package:flutter/material.dart';
import 'dart:async';

class AuctionSuccessScreen extends StatefulWidget {
  const AuctionSuccessScreen({super.key});

  @override
  State<AuctionSuccessScreen> createState() => _AuctionSuccessScreenState();
}

class _AuctionSuccessScreenState extends State<AuctionSuccessScreen> {
  @override
  void initState() {
    super.initState();
    // After 2 seconds, automatically go back to the previous screen
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        // Pop twice: once for this screen, once for the ScheduleAuctionPage
        // Assuming ScheduleAuctionPage is the screen before this one.
        Navigator.of(context).pop(); 
        Navigator.of(context).pop(); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007FFF), // Vibrant blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Space from the top
              // Success Text
              const Text(
                "Auction has been scheduled\nsuccessfully !!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.3, // Line spacing
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Subscriber will be notified on time",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Illustration fills the rest of the screen
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/sucess.png', // Your asset image
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}