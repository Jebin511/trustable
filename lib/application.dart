

import 'package:flutter/material.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Custom App Bar
              _buildAppBar(),
              const SizedBox(height: 30),

              // 2. Main Title
              _buildTitle(),
              const SizedBox(height: 30),

              // 3. Tab Header
              _buildTabHeader(),
              const SizedBox(height: 20),

              // 4. List of Application Requests
              _buildRequestCard(
                name: 'John Silver',
                amount: '₹50,000',
                duration: '/20month',
                avatarUrl: 'https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1976&q=80',
              ),
              const SizedBox(height: 16),
              _buildRequestCard(
                name: 'Peter parker',
                amount: '₹50,00,000',
                duration: '/20month',
                avatarUrl: 'https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
              ),
               const SizedBox(height: 16),
              _buildRequestCard(
                name: 'Siva Subramaniyan Krishnamoorthy', // Example of a very long name
                amount: '₹25,000',
                duration: '/10month',
                avatarUrl: 'https://images.unsplash.com/photo-1507003211169-e695c6edf230?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the top app bar with avatar and icons.
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80'),
        ),
        Row(
          children: [
            IconButton(icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey), onPressed: () {}),
            IconButton(icon: const Icon(Icons.inventory_2_outlined, color: Colors.grey), onPressed: () {}),
            IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
          ],
        ),
      ],
    );
  }

  /// Builds the main "Applications" title section.
  Widget _buildTitle() {
    return const Row(
      children: [
        Icon(Icons.inventory_2_outlined, color: Colors.black, size: 32),
        SizedBox(width: 12),
        Text(
          'Applications',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }

  /// Builds the "Application requests" tab header.
  Widget _buildTabHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Application requests',
          style: TextStyle(
            color: Color(0xFF007FFF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 2,
          width: 160, // Width of the underline
          color: const Color(0xFF007FFF),
        ),
      ],
    );
  }

  /// Builds a single blue card for an application request.
  Widget _buildRequestCard({
    required String name,
    required String amount,
    required String duration,
    required String avatarUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF007FFF),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 12),
          
          // --- FIX IS HERE ---
          // WRAPPED this Column in an Expanded widget to prevent overflow with long names.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name, 
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // Ensures long names don't wrap to a new line
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(amount, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(duration, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          // The Spacer is no longer needed because Expanded handles the spacing.

          _buildActionButton(
            icon: Icons.check,
            label: 'Accept',
            iconColor: const Color(0xFF007FFF),
          ),
          const SizedBox(width: 12),
          _buildActionButton(
            icon: Icons.close,
            label: 'Deny',
            iconColor: Colors.black,
          ),
        ],
      ),
    );
  }

  /// Builds a reusable action button (Accept/Deny).
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color iconColor,
  }) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: iconColor),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}