import 'package:flutter/material.dart';

class ChitFundDetailsScreen extends StatelessWidget {
  const ChitFundDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double logoRadius = 50.0;
    const double topSectionHeight = 220.0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                _buildHeader(topSectionHeight, logoRadius),
                Expanded(child: _buildTabBarView()),
              ],
            ),
            Positioned(
              top: topSectionHeight - logoRadius,
              child: _buildLogo(logoRadius),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: _buildBackButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double height, double logoRadius) {
    return Container(
      height: height,
      padding: EdgeInsets.only(top: logoRadius + 10, bottom: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF007FFF),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Swirl Chit Fund',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Mr. Sathyamoorthy',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const Spacer(),
          // MODIFIED: This TabBar uses UnderlineTabIndicator to work on older Flutter versions.
          const TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.white),
              insets: EdgeInsets.symmetric(horizontal: 40.0),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Organiser details'),
              Tab(text: 'Available schemes'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        // Organiser Details Tab
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              children: [
                _buildDetailItem('Organiser name', 'Palaniyappa'),
                _buildDetailItem('Company Name', 'Palaniyappa chit fund'),
                _buildDetailItem('Company Address', '5, Madavilagam, Thirunageswaram Thanjavur'),
                Row(
                  children: [
                    Expanded(child: _buildDetailItem('State', 'Tamilnadu')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildDetailItem('Year of registration', '2016')),
                  ],
                ),
                _buildDetailItem('Email', 'palaniyappachits@gmail.com'),
                _buildDetailItem('Phone Number', '9342869091'),
                _buildDetailItem('Chit Fund Certificate Number', 'CX2382909093'),
                _buildDetailItem('CIN Number', '9109202872'),
              ],
            ),
          ),
        ),
        
        _buildAvailableSchemesTab(),
      ],
    );
  }
  
  Widget _buildAvailableSchemesTab() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return _buildSchemeCard();
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Current chits',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
             GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return _buildSchemeCard();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchemeCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF007FFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                child: Text(
                  '₹50,000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Text(
                '/20months',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildCardDetail('Starting date', '09/09/2025')),
              const SizedBox(width: 8),
              Expanded(child: _buildCardDetail('Chit Group', 'LT012D OG')),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF007FFF),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              child: const Text('View'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        Text(
          value, 
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildLogo(double radius) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF007FFF),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: Center(
        child: Container(
          width: (radius - 10) * 2,
          height: (radius - 10) * 2,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(Icons.sync, color: Colors.black, size: 40),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}


