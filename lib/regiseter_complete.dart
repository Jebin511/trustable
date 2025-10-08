import 'dart:async';

import 'package:flutter/material.dart';


class RegistrationCompletedScreen extends StatefulWidget {
  const RegistrationCompletedScreen({super.key});

  @override
  State<RegistrationCompletedScreen> createState() => _RegistrationCompletedScreenState();
}

class _RegistrationCompletedScreenState extends State<RegistrationCompletedScreen> {
  @override
  void initState() {
    super.initState();
    // After 3 seconds, this screen will close automatically.
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // In a real app, you might navigate somewhere else.
        // For this example, we'll just pop the screen if possible.
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
  children: [
    // 1. BACKGROUND ILLUSTRATION ADDED
    // This fills the entire screen behind the other UI elements.
    Image.asset(
      'assets/Contact us-rafiki 1.png', // Your illustration
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ),

    // 2. The "Registration Completed" card UI
    Positioned(
      top: 80, // Adjusted for better centering
      left: 20,
      right: 20,
      child: _buildConfirmationCard(),
    ),
  ],
)
    );
  }

  /// Builds the white confirmation card.
  Widget _buildConfirmationCard() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Title and Checkmark Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                child: Text(
                  'Registration Completed',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFF007FFF), // Blue background for the checkmark
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Body Text
          Text(
            'Your request for registration of new chit scheme will be approved shortly......',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.4, // Line spacing
            ),
          ),
        ],
      ),
    );
  }
}