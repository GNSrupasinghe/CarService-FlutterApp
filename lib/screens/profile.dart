import 'dart:developer';

import 'package:car_service/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      final userDoc =
          await FirebaseFirestore.instance
              .collection('users') // Replace with your collection name
              .doc(uid) // Use email as the document ID
              .get();

      if (userDoc.exists) {
        return userDoc.data();
      }
    } catch (e) {
      log("Error fetching user data: $e");
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 220, 156),
        title: Text(
          "PROFILE INFORMATION",
          style: GoogleFonts.jockeyOne(color: Colors.black, fontSize: 30),
        ),
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      ),

      drawer: Drawer(
        backgroundColor: Color(0xFFFFF2B2), // Light yellow background
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button (top-right)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 4,
                indent: 10, // left space
                endIndent: 10, // right space
              ),
              // CAR HUB row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CAR",
                      style: GoogleFonts.jockeyOne(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.directions_car, size: 40),
                    SizedBox(width: 10),
                    Text(
                      "HUB",
                      style: GoogleFonts.jockeyOne(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 4,
                indent: 10, // left space
                endIndent: 10, // right space
              ),
              // Drawer items
              drawerItem(
                icon: Icons.add_circle_outline,
                text: "Add Car",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              drawerItem(
                icon: Icons.info_outline,
                text: "About Us",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              drawerItem(
                icon: Icons.privacy_tip_outlined,
                text: "Privacy & Policies",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Spacer(),
              Divider(thickness: 1.2),
              drawerItem(
                icon: Icons.logout,
                text: "Log Out",
                onTap: () {
                  AuthService().signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

      body: FutureBuilder<Map<String, dynamic>?>(
        future: getUserData(auth.currentUser!.uid), // Fetch user data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return Center(
              child: Text(
                "Error loading user data",
                style: GoogleFonts.jockeyOne(color: Colors.amber, fontSize: 20),
              ),
            );
          }