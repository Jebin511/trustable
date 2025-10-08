import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 60.0;
    const double headerHeight = 180.0;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background content with header and form
          SingleChildScrollView(
            child: Column(
              children: [
                // Blue curved header
                Container(
                  height: headerHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFF007FFF),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(MediaQuery.of(context).size.width, 100.0),
                    ),
                  ),
                ),
                // White form area
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(24, avatarRadius + 20, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Profile - Personal',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField('Name'),
                      _buildTextField('Date of birth'),
                      _buildTextField('Address', maxLines: 3),
                      _buildTextField('PIN/ZIP Code'),
                      _buildTextField('Aadhaar number'),
                      _buildTextField('PAN number'),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF007FFF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Save & Next', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Overlapping Profile Avatar
          Positioned(
            top: headerHeight - avatarRadius,
            child: _buildProfileAvatar(radius: avatarRadius),
          ),
        ],
      ),
    );
  }

  /// Builds the profile avatar with its edit button.
  Widget _buildProfileAvatar({required double radius}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // The main avatar
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: radius - 5, // Inner circle for image
            backgroundColor: Colors.grey[300],
            // You can add a backgroundImage here
            // backgroundImage: NetworkImage('your_image_url'),
          ),
        ),
        // The edit icon
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0056B3), // Darker blue for the edit button
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.edit, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }

  /// A reusable helper widget for labeled text fields.
  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


