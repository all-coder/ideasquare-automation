// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import './auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController rollNocontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordreenterController =
      TextEditingController();
  final TextEditingController clubNameController = TextEditingController();
  final TextEditingController memberTypeController = TextEditingController();

  Future<void> addUserToDB() async {
    const String backendURL = "http://localhost:57549/v1/user/signup";
    try {
      final response = await http.post(Uri.parse(backendURL),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": namecontroller.text,
            "roll_no": rollNocontroller.text,
            "club_name": clubNameController.text,
            "member_type": memberTypeController.text,
            "email": emailController.text,
            "password": passwordController.text
          }));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User registered successfully!")));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unable to register User")));
      }
    } catch (e) {
      print('Exception occured is:$e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Unable to register user due to the error:$e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/loginbackground.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40, left: 5),
                  child: const Text(
                    "User Registration",
                    style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontFamily: "Monospace",
                      fontSize: 29,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "Name",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(71, 59, 59, 59)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(238, 238, 238, 238),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter the name of the user";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: rollNocontroller,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.numbers),
                              hintText: "Roll Number",
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(71, 59, 59, 59)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(238, 238, 238, 238),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter the Roll number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                              controller: clubNameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.group),
                                hintText: "Club Name",
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(71, 59, 59, 59)),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(238, 238, 238, 238),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter the Roll number";
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                              controller: memberTypeController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                hintText: "Member Type",
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(71, 59, 59, 59)),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(238, 238, 238, 238),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter the Roll number";
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.alternate_email),
                              hintText: "e-mail",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(71, 59, 59, 59),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(238, 238, 238, 238),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email';
                              } else if (value.length != 20) {
                                return 'Please enter a valid email';
                              } else if (value.substring(8) != "@iittp.ac.in") {
                                return 'Please enter your institute email id';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              hintText: "password",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(71, 59, 59, 59),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(238, 238, 238, 238),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: passwordreenterController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              hintText: "Confirm Password",
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(71, 59, 59, 59),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(238, 238, 238, 238),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (passwordController.text !=
                                    passwordreenterController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Passowrd entered in the original place and the verification place is not matching. Kindly re-enter.")));
                                  passwordController.clear();
                                  passwordreenterController.clear();
                                  return;
                                }
                                // If validation passes
                                // print("Email: ${emailController.text}");
                                // print("Password: ${passwordController.text}");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                addUserToDB();

                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  setState(() {
                                    emailController.clear();
                                    passwordController.clear();
                                    passwordreenterController.clear();
                                    namecontroller.clear();
                                    rollNocontroller.clear();
                                    clubNameController.clear();
                                    memberTypeController.clear();
                                  });
                                });
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                const Color.fromARGB(255, 117, 115, 115),
                              ),
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(
                                  horizontal: 60,
                                  vertical: 15,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontFamily: "Monospace",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ))),
      ),
    );
  }
}
