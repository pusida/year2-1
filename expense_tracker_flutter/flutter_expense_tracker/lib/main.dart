import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/firebase_options.dart';
import 'package:flutter_expense_tracker/screen/daily_screen.dart';
import 'package:flutter_expense_tracker/screen/home_screen.dart';
import 'package:flutter_expense_tracker/screen/login_screen.dart';
import 'package:flutter_expense_tracker/screen/signup_screen.dart';
import 'package:flutter_expense_tracker/widgets/transactions_cards.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: LoginScreen(),
    );
  }
}
