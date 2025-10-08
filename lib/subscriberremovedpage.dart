 import 'package:flutter/material.dart';
import 'dart:async';

class SubscriberRemovedScreen extends StatefulWidget {
  const SubscriberRemovedScreen({super.key});

  @override
  State<SubscriberRemovedScreen> createState() => _SubscriberRemovedScreenState();
}

class _SubscriberRemovedScreenState extends State<SubscriberRemovedScreen> {
  @override
  void initState() {
    super.initState();
    // After 2 seconds, automatically go back to the previous screen
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
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
                "Subscriber removed successfully!\nLet's bring in a new one to keep things moving !",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.3, // Line spacing
                ),
              ),
              // Illustration fills the rest of the screen
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/subscriber_removed.png', // Your asset image
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