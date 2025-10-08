import 'package:flutter/material.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // UPDATED: List of titles now matches your screenshot
    final List<String> documentTitles = [
      'Application forms',
      'Surety form',
      'Monthly auction reports',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'OS - U - DOCS - surety',
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 14,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Documents',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: documentTitles.length,
                  itemBuilder: (context, index) {
                    return _buildDocumentTile(documentTitles[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// A helper method to build a styled ExpansionTile.
  Widget _buildDocumentTile(String title) {
    final List<String> applicationFormNames = [
      'Siva subramaniyan',
      'Sundar ramasamy',
      'Muthukumaran',
      'Rajesh',
      'Ravana pichai',
    ];
    
    // NEW: Data for the "Surety form" section
    final List<String> suretyFormNames = [
      'Siva subramaniyan',
      'Sundar ramasamy',
    ];

    // Conditionally build the children based on the title
    List<Widget> children;
    if (title == 'Application forms') {
      children = applicationFormNames.map((name) => _buildPdfLinkItem(name)).toList();
    } 
    // NEW: 'else if' block to handle the Surety form content
    else if (title == 'Surety form') {
      children = suretyFormNames.map((name) => _buildPdfLinkItem(name)).toList();
    }
    else {
      children = [
        ListTile(
          title: Text(
            'Content for "$title" goes here.',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ];
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: Colors.grey[100],
          child: ExpansionTile(
            key: PageStorageKey(title), // Helps maintain state in a list
            backgroundColor: Colors.grey[100],
            collapsedBackgroundColor: Colors.grey[100],
            trailing: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            shape: const Border(),
            collapsedShape: const Border(),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: children,
          ),
        ),
      ),
    );
  }
  
  /// Reusable helper to build the PDF link item.
  Widget _buildPdfLinkItem(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () {
          // Add document opening logic here
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.picture_as_pdf, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}