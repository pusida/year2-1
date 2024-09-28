import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/utils/appvalidator.dart';
import 'package:flutter_expense_tracker/screen/login_screen.dart';
import 'package:flutter_expense_tracker/services/auth_services.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitSignup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "username": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text,
        "remainingAmount": 0,
        "totalIncome": 0,
        "totalExpenses": 0,
      };

      await AuthService().createUser(data, context);
      setState(() {
        isLoader = false;
      });
    }
  }

  var appvalidator = Appvalidator();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primary,
      body: getBody(context, size),
    );
  }

  Widget getBody(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              Text(
                "Create new Account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: const Color.fromARGB(255, 48, 40, 40)),
              ),
              SizedBox(height: 60),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: const Color.fromARGB(255, 48, 40, 40)),
                      ),
                      TextFormField(
                          controller: _userNameController,
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person_2_outlined),
                            // hintText: "Username",
                          ),
                          validator: appvalidator.validateUsername),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: const Color.fromARGB(255, 48, 40, 40)),
                      ),
                      TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // controller: _email,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "Email",
                          ),
                          validator: appvalidator.validateEmail),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: const Color.fromARGB(255, 48, 40, 40)),
                      ),
                      TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          // controller: _email,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.phone_android_outlined),
                            hintText: "Phone Number",
                          ),
                          validator: appvalidator.validatePhoneNumber),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: const Color.fromARGB(255, 48, 40, 40)),
                      ),
                      PasswordField(controller: _passwordController),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.03),
                        spreadRadius: 10,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )),
                    onPressed: () {
                      log('test $_passwordController');
                      isLoader ? print("Loading") : _submitSignup();
                    },
                    child: isLoader
                        ? Center(child: CircularProgressIndicator(color: white))
                        : Text(
                            "Sign up",
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                  )),
              SizedBox(height: 7),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 48, 40, 40)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    var appvalidator = Appvalidator();

    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: _obscureText,
          cursorColor: Colors.black,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.black),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            hintText: "Password",
          ),
          validator: appvalidator.validatePassword,
        );
      },
    );
  }
}
