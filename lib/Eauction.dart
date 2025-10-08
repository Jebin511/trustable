import 'package:flutter/material.dart';
import 'package:trustable/schedule-page.dart';
// Import the new page you created
// import 'schedule_auction_page.dart';

class EauctionScreen extends StatefulWidget {
  const EauctionScreen({super.key});

  @override
  State<EauctionScreen> createState() => _EauctionScreenState();
}

class _EauctionScreenState extends State<EauctionScreen> {
  int _selectedTabIndex = 0; // 0 for Scheduled Auctions, 1 for Payouts
  // The state for showing the form is no longer needed
  // bool _showScheduleForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),

              // The button is now always visible
              _buildScheduleButton(),
              const SizedBox(height: 24),

              // The tabs and cards are now always visible
              _buildTabs(),
              const SizedBox(height: 16),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _selectedTabIndex == 0
                    ? _buildAuctionCard()
                    : _buildPayoutsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header widget
  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.settings_outlined, color: Colors.blue.shade800, size: 28),
        const SizedBox(width: 8),
        const Text(
          'E-auction',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Modified "Schedule auctions" button to navigate to the new page
  Widget _buildScheduleButton() {
    return OutlinedButton.icon(
      onPressed: () {
        // Navigate to the new page
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ScheduleAuctionPage()),
        );
      },
      icon: const Icon(Icons.av_timer_rounded),
      label: const Text('Schedule auctions'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.lightBlue.shade50,
        side: const BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  // Tabs widget (remains the same)
  Widget _buildTabs() {
    return Row(
      children: [
        _buildTabItem('Scheduled Auctions', 0),
        const SizedBox(width: 24),
        _buildTabItem('Payouts', 1),
      ],
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isActive = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue.shade700 : Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          if (isActive)
            Container(
              height: 2,
              width: title.length * 8.0,
              color: Colors.blue.shade700,
            )
        ],
      ),
    );
  }

  // Payouts Card placeholder
  Widget _buildPayoutsCard() {
    return Container(
      key: const ValueKey('payoutsCard'),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF007FFF),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Center(
          child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Text("Payouts Card UI",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      )),
    );
  }

  // Scheduled Auctions Card placeholder
  Widget _buildAuctionCard() {
    return Container(
      key: const ValueKey('auctionCard'),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade500],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
          child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Text("Scheduled Auctions Card UI",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      )),
    );
  }
}


class Schedule_auction extends StatefulWidget {
  const Schedule_auction({super.key});

  @override
  State<EauctionScreen> createState() => _EauctionScreenState();
}

class _Schedule_auction extends State<Schedule_auction> {
  // These state variables are no longer needed as the screen is static
  // int _selectedTabIndex = 0;
  // bool _showScheduleForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background color outside the main blue area
      body: Stack(
        children: [
          // 1. Full-screen background illustration
          Positioned.fill(
            child: Image.asset(
              'assets/background_illustration.png', // <--- REPLACE WITH YOUR ACTUAL IMAGE PATH
              // Using a placeholder network image for demonstration if the asset isn't available
              // image: NetworkImage('https://i.imgur.com/your_illustration_asset.png'),
              fit: BoxFit.cover,
            ),
          ),
          // 2. Main Blue Container that holds the form
          Positioned(
            top: 20, // Adjust these values to match padding in your original image
            left: 20,
            right: 20,
            bottom: 20, // Keep this value to show the illustration below
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF007BFF), // A vibrant blue color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(), // E-auction header
                    const SizedBox(height: 30), // Spacing after the header

                    // Form Fields are directly placed here
                    _buildFormTextFieldWithLabel('Select scheme'),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: _buildFormTextFieldWithLabel('Auction Date')),
                        const SizedBox(width: 16),
                        Expanded(child: _buildFormTextFieldWithLabel('Auction Timing')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildFormTextFieldWithLabel('Duration'),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: _buildFormTextFieldWithLabel('Bid range(min-max)')),
                        const SizedBox(width: 16),
                        Expanded(child: _buildFormTextFieldWithLabel('Members participating')),
                      ],
                    ),
                    const SizedBox(height: 40), // Spacing before the button
                    Align(
                      alignment: Alignment.centerRight, // Align button to the right
                      child: _buildScheduleButton(),
                    ),
                    // Remaining space below the form for the illustration to show
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Header widget
  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.settings_outlined, color: Colors.black, size: 28), // Wrench icon is black
        const SizedBox(width: 8),
        const Text(
          'E-auction',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Text color is black
          ),
        ),
      ],
    );
  }

  // Schedule button
  Widget _buildScheduleButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle schedule submission, e.g., show a success message or navigate
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // White background for the button
        foregroundColor: Colors.blue.shade800, // Blue text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        elevation: 0, // No shadow for the button
      ),
      child: const Text(
        'Schedule',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Helper for text fields in the form with labels above them
  Widget _buildFormTextFieldWithLabel(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white, // Label color is white
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: '', // No hint text visible in the image
            filled: true,
            fillColor: Colors.white, // White background for fields
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // No border visible in image
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white, width: 2.0), // Focus border
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: const TextStyle(color: Colors.black87), // Input text color
        ),
      ],
    );
  }
}