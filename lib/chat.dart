
import 'package:flutter/material.dart';

class RecentChatsScreen extends StatefulWidget {
  const RecentChatsScreen({super.key});

  @override
  State<RecentChatsScreen> createState() => _RecentChatsScreenState();
}

class _RecentChatsScreenState extends State<RecentChatsScreen> {
  int _selectedTabIndex = 0;

  // Sample data for the chat list
  final List<Map<String, dynamic>> _chatData = [
    {
      'name': 'Palaniyappa',
      'message': 'Hi I this is owner palani',
      'time': '18.31',
      'unreadCount': 5,
      'isOnline': false,
      'avatarUrl': 'https://images.unsplash.com/photo-1566753323558-f4e0952af115?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1921&q=80',
    },
    {
      'name': 'Swirl Chit Fund',
      'message': 'Hello guys we have discussed about',
      'time': 'Yesterday',
      'unreadCount': 0,
      'isOnline': true,
      'isGroup': true, // To show a different icon
    },
    {
      'name': 'Jayaprakash',
      'message': 'I want to talk to you about ur scheme',
      'time': 'Yesterday',
      'unreadCount': 0,
      'isOnline': false,
      'avatarUrl': 'https://images.unsplash.com/photo-1507003211169-e695c6edf230?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Recent Chats',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Custom Tab Bar
          _CustomTabBar(
            selectedIndex: _selectedTabIndex,
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          const SizedBox(height: 16),
          // Chat List
          Expanded(
            child: ListView.separated(
              itemCount: _chatData.length,
              separatorBuilder: (context, index) => const Divider(indent: 80, endIndent: 20),
              itemBuilder: (context, index) {
                final chat = _chatData[index];
                return _ChatItem(
                  name: chat['name'],
                  message: chat['message'],
                  time: chat['time'],
                  unreadCount: chat['unreadCount'],
                  isOnline: chat['isOnline'],
                  avatarUrl: chat['avatarUrl'],
                  isGroup: chat['isGroup'] ?? false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Custom TabBar Widget
class _CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const _CustomTabBar({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          _buildTabItem(text: 'All chats', index: 0),
          const SizedBox(width: 10),
          _buildTabItem(text: 'Groups', index: 1),
        ],
      ),
    );
  }

  Widget _buildTabItem({required String text, required int index}) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF007FFF) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Custom Chat Item Widget
class _ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final bool isOnline;
  final String? avatarUrl;
  final bool isGroup;

  const _ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.isOnline,
    this.avatarUrl,
    this.isGroup = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
            child: isGroup ? const Icon(Icons.sync, color: Colors.black) : null,
          ),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        message,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          if (unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFF007FFF),
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )
          else
            const SizedBox(height: 18), // To maintain alignment
        ],
      ),
    );
  }
}

