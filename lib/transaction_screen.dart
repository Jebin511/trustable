import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using DefaultTabController to manage the tabs state
    return DefaultTabController(
      length: 2, // Number of tabs
      initialIndex: 1, // "Transaction" tab is active initially
      child: Scaffold(
        backgroundColor: const Color(0xFF007FFF), // Main blue background
        appBar: _buildAppBar(context),
        body: TabBarView(
          children: [
            // Placeholder for "Chit details" tab
            const Center(child: Text('Chit Details Page', style: TextStyle(color: Colors.white))),
            
            // The main transaction list for the "Transaction" tab
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  // Custom AppBar with back button and tabs
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF007FFF),
      elevation: 0,
      title: const Text('OS-TRANSACTION', style: TextStyle(fontSize: 14, color: Colors.white70)),
      centerTitle: true,
      leading: IconButton(
        icon: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back, color: Color(0xFF007FFF)),
        ),
        onPressed: () {
          // Navigator.of(context).pop(); // Uncomment for real navigation
        },
      ),
      bottom: const TabBar(
        indicatorColor: Colors.white,
        indicatorWeight: 3.0,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        tabs: [
          Tab(text: 'Chit details'),
          Tab(text: 'Transaction'),
        ],
      ),
    );
  }

  // Builds the scrollable list of transaction groups
  Widget _buildTransactionList() {
    // Sample data structure for the list
    final transactionData = {
      'April 25': [
        {'type': 'Money sent', 'amount': 2500.0, 'account': 'SBI Account ***********32', 'time': '22:35'},
        {'type': 'Money Received', 'amount': 50000.0, 'account': 'SBI Account ***********32', 'time': '22:35'},
      ],
      'April 17': [
        {'type': 'Money sent', 'amount': 2500.0, 'account': 'SBI Account ***********32', 'time': '22:35'},
        {'type': 'Money Received', 'amount': 50000.0, 'account': 'SBI Account ***********32', 'time': '22:35'},
      ],
      'April 16': [
        {'type': 'Money sent', 'amount': 2500.0, 'account': 'SBI Account ***********32', 'time': '22:35'},
      ],
    };

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: transactionData.keys.length,
      itemBuilder: (context, index) {
        String date = transactionData.keys.elementAt(index);
        List<Map<String, dynamic>> transactions = transactionData[date]!;
        return _TransactionGroup(date: date, transactions: transactions);
      },
    );
  }
}

// A widget to represent a group of transactions for a specific date
class _TransactionGroup extends StatelessWidget {
  final String date;
  final List<Map<String, dynamic>> transactions;

  const _TransactionGroup({required this.date, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...transactions.map((tx) => _TransactionCard(
            type: tx['type'],
            amount: tx['amount'],
            account: tx['account'],
            time: tx['time'],
          )).toList(),
        ],
      ),
    );
  }
}

// A widget for a single transaction card
class _TransactionCard extends StatelessWidget {
  final String type;
  final double amount;
  final String account;
  final String time;

  const _TransactionCard({
    required this.type,
    required this.amount,
    required this.account,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black54),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(type, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('₹${amount.toStringAsFixed(0)}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF007FFF))),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('To: $account', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(width: 4),
                      const Icon(Icons.info, color: Color(0xFF007FFF), size: 14),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Sent at $time', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


