import 'package:flutter/material.dart';
import 'package:trustable/personalprof.dart';

class Call extends StatelessWidget {
  const Call({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (full screen)
          Positioned.fill(
            child: Image.asset(
              "assets/GET-REGISTERED.jpg", // replace with your background image
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 80), // spacing from top

                // Text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Text(
                    "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 90),

                // "Register now" button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Register now"),
                ),

                const SizedBox(height: 20),

                // "Click here to call" button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => PersonalProfilePage()));
                  },
                  icon: const Icon(Icons.call, color: Colors.black),
                  label: const Text(
                    "Click here to schedule a free call",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}