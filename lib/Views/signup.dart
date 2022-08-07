// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:yartu/Auth/auth.dart';
import 'package:yartu/Views/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? username;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordvisible = true;
  @override
  void initState() {
    super.initState();

    _passwordvisible = false;
  }

  final AuthService _authService = AuthService();
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28.0, 74, 28, 28),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(clipBehavior: Clip.none, children: [
                      Image.asset(
                        "assets/images/1.png",
                      ),
                      Positioned(
                          left: 21,
                          bottom: 9,
                          child: Image.asset(
                            "assets/images/2.png",
                          )),
                    ]),
                    const SizedBox(
                      width: 36,
                    ),
                    Image.asset("assets/images/3.png"),
                    const SizedBox(
                      width: 1,
                    ),
                    Image.asset("assets/images/4.png"),
                    const SizedBox(
                      width: 2,
                    ),
                    Image.asset("assets/images/5.png"),
                    const SizedBox(
                      width: 2,
                    ),
                    Image.asset("assets/images/6.png"),
                    const SizedBox(
                      width: 2,
                    ),
                    Image.asset("assets/images/7.png"),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 40,
                  width: 90,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff394C66),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 300,
                  height: 40,
                  child: Text(
                    "Welcome Back, please sign up to your account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff9AA1B4),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Email or username ",
                  style: TextStyle(fontSize: 14, color: Color(0xff394C66)),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff9AA1B4)),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (pass) {
                      email = pass;
                    }),
                Row(
                  children: [
                    Padding(
                      padding: 10.verticalP,
                      child: const Text(
                        "Password",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff394C66)),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _passwordvisible,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        child: const Icon(Icons.remove_red_eye_outlined),
                        onTap: () {
                          setState(() {
                            _passwordvisible = !_passwordvisible;
                          });
                        },
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff9AA1B4)),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a valid password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (pass) {
                    password = pass;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    SizedBox(
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff2356F6)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                  onPressed: () async {
                    try {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                      await _authService
                          .createPerson(
                        _emailController.text,
                        _passwordController.text,
                      )
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "Registered",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == "weak-password") {
                        Fluttertoast.showToast(
                            msg: "Your Password Must be 6 Or More Characters",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                      } else if (e.code == 'invalid-email') {
                        Fluttertoast.showToast(
                            msg: "Check Your E-Mail",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                      } else if (e.code == 'email-already-in-use') {
                        Fluttertoast.showToast(
                            msg: "The Account Already Exist",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                      }
                    }
                    // ignore: dead_code_on_catch_subtype
                    on FirebaseAuthException catch (e) {
                      // ignore: avoid_print
                      print('Failed with error code: ${e.code}');
                      print(e.message);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Sign Up"),
                    ],
                  ),
                ),
                Divider(
                  height: height / 15,
                  color: const Color(0xffE5EBF5),
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Do you have an account?",
                      style: TextStyle(fontSize: 16, color: Color(0xff394C66)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff3663F2)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
