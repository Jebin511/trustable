import 'package:flutter/material.dart';

class ManageSubscribersScreen extends StatelessWidget {
  const ManageSubscribersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background
      body: Stack(
        children: [
          // Background blue band at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 120, // Height of the blue band
            child: Container(
              color: const Color(0xFFE0E0E0), // Use your specific blue color if different
            ),
          ),
          // Content of the screen
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Spacer for the back button
                const SizedBox(height: 50),
                // Header "Manage subscribers"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    'Manage subscribers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                // The white card for the list
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, -3), // subtle shadow at the top
                        ),
                      ],
                    ),
                    child: ListView(
                      padding: const EdgeInsets.only(top: 20.0), // Padding inside the list view
                      children: const [
                        // List of subscriber items
                        SubscriberListItem(
                          name: 'Francis Holzworth',
                          customerId: 'ID#00222',
                          imageUrl: 'https://images.unsplash.com/photo-1507003211169-e695c6edf230?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                        ),
                        SubscriberListItem(
                          name: 'Kaylyn Yokel',
                          customerId: 'ID#00222',
                          imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29329?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
                        ),
                        SubscriberListItem(
                          name: 'Kimberly Muro',
                          customerId: 'ID#00222',
                          imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1888&q=80',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Back Button positioned on top
          Positioned(
            top: 50,
            left: 20,
            child: _buildBackButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1E90FF), // A bright blue color
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

// A custom widget for each subscriber list item
class SubscriberListItem extends StatelessWidget {
  final String name;
  final String customerId;
  final String imageUrl;

  const SubscriberListItem({
    super.key,
    required this.name,
    required this.customerId,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  customerId,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF1E90FF), size: 24),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit $name')),
              );
            },
          ),
        ],
      ),
    );
  }
}