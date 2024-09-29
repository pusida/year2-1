import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/services/auth_services.dart';
import 'package:flutter_expense_tracker/utils/appvalidator.dart';
import 'package:flutter_expense_tracker/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "email": _emailController.text,
        "password": _passwordController.text,
      };

      await AuthService().login(data, context);
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
      backgroundColor: const Color.fromARGB(255, 196, 190, 190),
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
              SizedBox(height: 20),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/3.png"),
                        fit: BoxFit.contain)),
              ),
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
              SizedBox(
                height: 20,
              ),
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
              SizedBox(
                height: 60,
              ),
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
                      isLoader ? print("Loading") : _submitLogin();
                    },
                    child: isLoader
                        ? Center(child: CircularProgressIndicator(color: white))
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                  )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text(
                  "Create new account",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
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
