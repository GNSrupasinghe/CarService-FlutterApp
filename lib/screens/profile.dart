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