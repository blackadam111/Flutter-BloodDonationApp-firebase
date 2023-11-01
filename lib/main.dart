import 'package:blood_donation_app/pages/addUser.dart';
import 'package:blood_donation_app/pages/homePage.dart';
import 'package:blood_donation_app/pages/updateUser.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      routes: {
        '/': (context) => HomePage(),
        '/adduser': (context) => AddUser(),
        '/updateuser': (context) => UpdateUser()
      },
      initialRoute: '/',
    );
  }
}
