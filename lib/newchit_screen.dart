import 'package:flutter/material.dart';
import 'package:trustable/search_subs.dart';

class NewChitScreen extends StatelessWidget {
  const NewChitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The bottom navigation bar and FAB properties have been removed.
      body: Stack(
        children: [
          // 1. YOUR BACKGROUND ILLUSTRATION GOES HERE
          Container(
            color: const Color(0xFF007FFF), // Blue background from your image
            // Example:
            child: Image.asset(
              'assets/Thinking face-bro 1.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // 2. "Search subscribers" button at the top right
          Positioned(
            top: 60, // Adjust position from top as needed
            right: 20,
            child: _buildSearchButton(context),
          ),

          // 3. The main "New Chit" form card, now shorter
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // MODIFIED: Height reduced to show more illustration
              height: MediaQuery.of(context).size.height * 0.60,
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(child: _buildNewChitForm()),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the "Search subscribers" button
  Widget _buildSearchButton(context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) =>SearchSubscribersScreen()));
      },
      icon: const Icon(Icons.person_outline, size: 20),
      label: const Text('Search subscribers'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: const StadiumBorder(), // Pill shape
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }

  // Widget for the form content inside the white card
  Widget _buildNewChitForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'New Chit',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF007FFF),
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Form Fields
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildFormField('Enter duration', isDropdown: true),
            ),
            const SizedBox(width: 16),
            Expanded(child: _buildFormField('Enter monthly value')),
          ],
        ),
        const SizedBox(height: 16),

        _buildFormField("Month's total value"),
        const SizedBox(height: 16),

        _buildFormField('Enter chit group number'),
        const SizedBox(height: 24),

        // Create button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF007FFF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          ),
          child: const Text(
            'Create',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // Reusable helper for a label and its input field
  Widget _buildFormField(String label, {bool isDropdown = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: isDropdown
              ? _buildDropdown()
              : const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
        ),
      ],
    );
  }

  // Specific dropdown widget for the "duration" field
  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
      value: '12 Months',
      items: ['12 Months', '24 Months', '36 Months']
          .map((label) => DropdownMenuItem(value: label, child: Text(label)))
          .toList(),
      onChanged: (value) {},
    );
  }

  // The _buildBottomAppBar method has been removed.
}
