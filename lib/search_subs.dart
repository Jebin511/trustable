import 'package:flutter/material.dart';

class SearchSubscribersScreen extends StatefulWidget {
  const SearchSubscribersScreen({super.key});

  @override
  State<SearchSubscribersScreen> createState() => _SearchSubscribersScreenState();
}

class _SearchSubscribersScreenState extends State<SearchSubscribersScreen> {
  // Sample data for recent subscribers
  final List<Map<String, String>> _recentSubscribers = [
    {'name': 'Joseph kuruvila V', 'details': '₹500000', 'avatar': 'assets/avatar1.png'},
    {'name': 'Bharath chandru S', 'details': '₹100000', 'avatar': 'assets/avatar2.png'},
    {'name': 'Jayaprakash A', 'details': 'Kumbakonam', 'avatar': 'assets/avatar3.png'},
  ];

  // --- NEW: State for the filter modal ---
  bool _vacantSeatsOnly = false;

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to take full screen height
      backgroundColor: Colors.transparent,
      builder: (context) {
        // Using a StatefulWidget for the modal's internal state (like the checkbox)
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                border: Border.all(color: const Color(0xFF007FFF), width: 2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Search by filter', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Form Fields
                  Row(
                    children: [
                      Expanded(child: _buildFilterFormField('Chit Value')),
                      const SizedBox(width: 16),
                      Expanded(child: _buildFilterFormField('Location', isDropdown: true)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildFilterFormField('Income'),
                  const SizedBox(height: 16),
                  // Vacant Seats Checkbox
                  Row(
                    children: [
                      const Text('Vacant Seats', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 8),
                      Checkbox(
                        value: _vacantSeatsOnly,
                        onChanged: (bool? value) {
                          setModalState(() {
                            _vacantSeatsOnly = value ?? false;
                          });
                        },
                        activeColor: const Color(0xFF007FFF),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF007FFF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Clear filters'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Apply filter logic here
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF007FFF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Apply'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // --- END: New state and methods for the filter modal ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF007FFF),
        elevation: 0,
        title: const Text('NEW CHIT', style: TextStyle(color: Colors.white, fontSize: 16)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF007FFF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: const Text('Create Scheme', style: TextStyle(fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.description_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: const BoxDecoration(color: Color(0xFF007FFF)),
            child: _buildSearchBar(),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Recent', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _recentSubscribers.length,
                      itemBuilder: (context, index) {
                        final subscriber = _recentSubscribers[index];
                        return _buildSubscriberListItem(
                          avatarPath: subscriber['avatar']!,
                          name: subscriber['name']!,
                          details: subscriber['details']!,
                          onRemove: () {
                            setState(() {
                              _recentSubscribers.removeAt(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search subscribers by location,money',
                hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          // MODIFIED: Filter icon is now a button
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.grey),
            onPressed: _showFilterModal, // Triggers the modal
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriberListItem({required String avatarPath, required String name, required String details, required VoidCallback onRemove}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(avatarPath),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 14,
                    color: (details.startsWith('₹') ? const Color(0xFF007FFF) : Colors.grey.shade600),
                    fontWeight: details.startsWith('₹') ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }

  // --- NEW: Helper widgets for the filter form ---
  Widget _buildFilterFormField(String label, {bool isDropdown = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          padding: isDropdown ? const EdgeInsets.symmetric(horizontal: 12) : null,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: isDropdown
              ? DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: 'All',
                    items: ['All', 'Chennai', 'Madurai'].map((String value) {
                      return DropdownMenuItem<String>(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (_) {},
                  ),
                )
              : const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
        ),
      ],
    );
  }
}