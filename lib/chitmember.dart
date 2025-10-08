import 'package:flutter/material.dart';
import 'dart:async';


// --------------------------------------------------
//           Main Screen: Chit Members
// --------------------------------------------------

class ChitMembersScreen extends StatefulWidget {
  const ChitMembersScreen({super.key});

  @override
  State<ChitMembersScreen> createState() => _ChitMembersScreenState();
}

class _ChitMembersScreenState extends State<ChitMembersScreen> {
  final List<Map<String, dynamic>> _members = [
    {'name': 'Siva subramaniyan', 'payment': true, 'bidding': true},
    {'name': 'Muthukumaran', 'payment': true, 'bidding': false},
    {'name': 'Vijay Kumar samy', 'payment': true, 'bidding': true},
    {'name': 'Ajay rivab jadeja', 'payment': true, 'bidding': true},
    {'name': 'Sundar ramasamy', 'payment': true, 'bidding': false},
  ];

  bool _isEditMode = false;

  void _removeMember(int index) {
    setState(() {
      _members.removeAt(index);
    });
  }

  // MODIFIED: This method now navigates to the success screen
  void _showRemoveConfirmationDialog(int index) {
    String memberName = _members[index]['name'];

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF007FFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Text(
            'Are you sure you want to remove $memberName from the chit?',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF007FFF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Yes'),
              onPressed: () {
                _removeMember(index);
                Navigator.of(dialogContext).pop(); // Close the dialog

                // <<< --- NAVIGATION ADDED HERE --- >>>
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SubscriberRemovedScreen()),
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF007FFF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Just close the dialog
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.only(bottom: 20.0),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007FFF),
      body: Column(
        children: [
          _buildTopBar(context),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCardHeader(),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: [
                        _buildMembersTable(_members),
                      ],
                    ),
                  ),
                  _buildEditButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Color(0xFF007FFF)),
          ),
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Chit members', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMembersTable(List<Map<String, dynamic>> members) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(
            children: [
              Expanded(flex: 4, child: Text('Members', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
              Expanded(flex: 2, child: Center(child: Text('Payment\nStatus', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)))),
              Expanded(flex: 2, child: Center(child: Text('Bidding\nStatus', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)))),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
        const Divider(),
        ...members.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> member = entry.value;
          return _buildMemberRow(
            index: index,
            name: member['name'],
            hasPaid: member['payment'],
            isBidding: member['bidding'],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildMemberRow({required int index, required String name, required bool hasPaid, required bool isBidding}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        children: [
          Expanded(flex: 4, child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))),
          Expanded(flex: 2, child: Center(child: Icon(Icons.check_circle, color: hasPaid ? Colors.green : Colors.grey.shade300))),
          Expanded(flex: 2, child: Center(child: Icon(Icons.gavel, color: isBidding ? const Color(0xFF007FFF) : Colors.grey.shade300))),
          Expanded(
            flex: 1,
            child: Center(
              child: _isEditMode
                  ? IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () => _showRemoveConfirmationDialog(index),
                    )
                  : Icon(Icons.do_not_disturb_on, color: Colors.grey.shade300),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            _isEditMode = !_isEditMode;
          });
        },
        icon: Icon(_isEditMode ? Icons.check : Icons.edit, size: 18),
        label: Text(_isEditMode ? 'DONE' : 'EDIT'),
        style: ElevatedButton.styleFrom(
          backgroundColor: _isEditMode ? Colors.green : const Color(0xFF007FFF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}

// --------------------------------------------------
//           The New Success Screen
// --------------------------------------------------

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
              const Text(
                "Subscriber removed successfully!\nLet's bring in a new one to keep things moving !",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.3, // Line spacing
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/remove.png', // Your asset image
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