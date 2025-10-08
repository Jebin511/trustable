import 'package:flutter/material.dart';
import 'package:trustable/managesubscribers.dart';
// Make sure to import the screen you are navigating to
// import 'manage_subscribers_screen.dart';

class ChitFundPage extends StatelessWidget {
  const ChitFundPage({super.key});

  @override
  Widget build(BuildContext context) {
    // The rest of your ChitFundPage code remains the same...
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBackButton(context),
                const SizedBox(height: 20),
                _buildMainFundCard(),
                const SizedBox(height: 20),
                _buildGridInfoCards(),
                const SizedBox(height: 20),
                _buildViewTransactionsCard(),
                const SizedBox(height: 20),
                _buildAuctionAndDefaulterCards(),
                const SizedBox(height: 30),
                // This header now includes the navigation logic
                _buildSubscribersHeader(context),
                const SizedBox(height: 20),
                _buildSubscriberCard(
                  name: 'Francis Holzworth',
                  customerId: 'Customer ID#00222',
                  paymentStatus: true,
                  activeStatus: true,
                ),
                const SizedBox(height: 15),
                _buildSubscriberCard(
                  name: 'Kaylyn Yokel',
                  customerId: 'Customer ID#00222',
                  paymentStatus: true,
                  activeStatus: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // This is the MODIFIED part. The EDIT button now navigates.
  Widget _buildSubscribersHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Subscribers', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        // Wrapped the button in a GestureDetector to handle taps
        GestureDetector(
          onTap: () {
            // <<< --- NAVIGATION ADDED HERE --- >>>
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ManageSubscribersScreen()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0095ff),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Row(
              children: [
                Text('EDIT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Icon(Icons.edit, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- All other helper methods from your code remain unchanged ---

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF0095ff),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  Widget _buildMainFundCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0095ff),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(color: const Color(0xFFc41e5b), width: 5),
                      ),
                      child: const Center(child: Text('👑', style: TextStyle(fontSize: 32))),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Royal Chit Fund', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Text('₹50000', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Tenure', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Text('August 07 2024 to', style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text('December 08 2025', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Duration - 20 months', style: TextStyle(color: Colors.white, fontSize: 14)),
              Text('PSO number f773k34912', style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridInfoCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildInfoCard(icon: '💰', title: 'Monthly due', value: '₹2500')),
            const SizedBox(width: 15),
            Expanded(child: _buildInfoCard(icon: '👥', title: 'Total subscribers', value: '20')),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: _buildInfoCard(icon: '🏛️', title: 'Chit group', value: 'L12342B')),
            const SizedBox(width: 15),
            Expanded(child: _buildInfoCard(icon: '📊', title: 'Net profit', value: '30000')),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard({required String icon, required String title, required String value}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0095ff),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 24))),
          ),
          const SizedBox(height: 15),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildViewTransactionsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFF0095ff), width: 2),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('View transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
              SizedBox(height: 4),
              Text('Track your chit cash flow', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF0095ff),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildAuctionAndDefaulterCards() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0095ff).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(child: Text('🏆', style: TextStyle(fontSize: 24))),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('06', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Auction winners', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0095ff).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(child: Text('🔒', style: TextStyle(fontSize: 24))),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('02', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Defaulter', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubscriberCard({required String name, required String customerId, required bool paymentStatus, required bool activeStatus}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(Icons.person, color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(customerId, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: paymentStatus ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 15),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF0095ff),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.thumb_up, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}