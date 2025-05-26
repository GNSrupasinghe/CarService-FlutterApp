import 'dart:developer';

import 'package:car_service/auth/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatelessWidget {
  const History({super.key});

  Future<List<Map<String, dynamic>>> getUserServiceData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return [];

      final querySnapshot =
          await FirebaseFirestore.instance
              .collection('servicedata')
              .where('email', isEqualTo: user.email)
              .get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      log("Error fetching service data: $e");
      return [];
    }
  }