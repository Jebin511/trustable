import 'package:flutter/material.dart';
import 'dart:async';

import 'package:trustable/auctionsucess.dart'; // Make sure to import dart:async for Timer if this is in a separate file

// Assuming AuctionSuccessScreen is defined in this file or imported
// import 'auction_success_screen.dart'; // If in a separate file

class ScheduleAuctionPage extends StatelessWidget {
  const ScheduleAuctionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/E-AUCTION.jpg"), // your full canvas
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 40), // pushed down
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFormTextField("Select scheme"),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(child: _buildFormTextField("Auction Date")),
                    const SizedBox(width: 16),
                    Expanded(child: _buildFormTextField("Auction Timing")),
                  ],
                ),
                const SizedBox(height: 20),

                _buildFormTextField("Duration"),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(child: _buildFormTextField("Bid range(min-max)")),
                    const SizedBox(width: 16),
                    Expanded(child: _buildFormTextField("Members participating")),
                  ],
                ),
                const SizedBox(height: 30),

                // Button aligned right
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // NEW: Navigate to the AuctionSuccessScreen
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const AuctionSuccessScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // smaller size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 14, // smaller font
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}