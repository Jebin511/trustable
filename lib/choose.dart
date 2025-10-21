import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({Key? key}) : super(key: key);

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0EA5E9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            
            // Welcome text
            const Text(
              'Welcome!!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Question text
            const Text(
              'Want to register as ?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Selection cards
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Organiser Card
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/welcome'),//_showToast('You clicked organizer'),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.business_center,
                          size: 60,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0EA5E9),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Organiser',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(width: 20),
                
                // Subscriber Card
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/welcome'),//_showToast('You clicked subscriber'),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey[700],
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.grey[700],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.grey[700],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.check_circle,
                                  size: 20,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0EA5E9),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'Subscriber',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            const Spacer(),
            
            // Illustration
            Image.asset(
              'assets/high_five.png',
              height: 500,
              width: 750,
              fit: BoxFit.contain,
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}