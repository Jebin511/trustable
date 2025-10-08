import 'package:flutter/material.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the individual ratings
    final List<Map<String, dynamic>> ratingsData = [
      {'name': 'Siva subramaniyan', 'rating': 5.0},
      {'name': 'Muthukumaran', 'rating': 5.0},
      {'name': 'Vijay Kumar', 'rating': 5.0},
      {'name': 'Ajay', 'rating': 3.0},
      {'name': 'Sundar ramasamy', 'rating': 4.0},
      {'name': 'Siva subramaniyan', 'rating': 5.0},
      {'name': 'Muthukumaran', 'rating': 5.0},
      {'name': 'Vijay Kumar', 'rating': 5.0},
      {'name': 'Ajay', 'rating': 3.0},
      {'name': 'Sundar ramasamy', 'rating': 4.0},
      {'name': 'Siva subramaniyan', 'rating': 5.0},
      {'name': 'Muthukumaran', 'rating': 5.0},
    ];

    // MODIFIED: The root widget is now a Scaffold.
    return Scaffold(
      backgroundColor: const Color(0xFF007FFF), // Vibrant blue background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding to mimic the original margin
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              _buildHeader(),

              // "Individual ratings" sub-header
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Individual ratings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              // Divider line
              Divider(color: Colors.white.withOpacity(0.3), height: 1),

              // Scrollable list of individual ratings
              Expanded(
                child: ListView.builder(
                  itemCount: ratingsData.length,
                  itemBuilder: (context, index) {
                    final item = ratingsData[index];
                    return _buildRatingListItem(
                      index: index + 1,
                      name: item['name'],
                      rating: item['rating'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header section with logo, title, and overall rating.
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.sync, color: Colors.black, size: 32),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Swirl Chit Fund',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Mr. Sathyamoorthy',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                'Overall',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              _buildStarRating(5.0), // 5-star overall rating
            ],
          ),
        ],
      ),
    );
  }

  /// Builds a single item in the individual ratings list.
  Widget _buildRatingListItem({
    required int index,
    required String name,
    required double rating,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                index.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _buildStarRating(rating),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.white.withOpacity(0.3), height: 1),
        ],
      ),
    );
  }

  /// A reusable helper widget to build a row of 5 stars.
  Widget _buildStarRating(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.yellow.shade600,
          size: 24,
        );
      }),
    );
  }
}