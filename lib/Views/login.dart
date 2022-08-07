// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yartu/Auth/auth.dart';
import 'package:yartu/Views/signup.dart';
import 'package:yartu/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();
  bool value = true;
  // ignore: prefer_final_fields
  AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordvisible = true;
  @override
  void initState() {
    super.initState();

    _passwordvisible = false;
  }

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
                    "Sign In",
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
                    "Welcome Back, please log in to your account",
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
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff9AA1B4)),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
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
                    const Text(
                      "Password",
                      style: TextStyle(fontSize: 14, color: Color(0xff394C66)),
                    ),
                    const SizedBox(height: 8),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff3663F2)),
                      ),
                    ),
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
                        return "Please enter a valid passoword";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (pass) {
                      password = pass;
                    }),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        checkColor: Colors.white,
                        value: value,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      "Keep me logged in",
                      style: TextStyle(fontSize: 16, color: Color(0xff394C66)),
                    )
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
                          .signIn(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "Giriş Yapıldı",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == " Invalid-email") {
                        Fluttertoast.showToast(
                            msg:
                                "E-Mail geçersiz üye olmadıysanız üye olabilirsiniz",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                      } else if (e.code == "user-not-found") {
                        Fluttertoast.showToast(
                            msg: "The User Not Found",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);
                      } else if (e.code == 'wrong-password') {
                        Fluttertoast.showToast(
                            msg: "Invalid Password",
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
                      print('Failed with error code: ${e.code}');
                      print(e.message);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Sign In"),
                    ],
                  ),
                ),
                Divider(
                  height: height / 15,
                  color: const Color(0xffE5EBF5),
                  indent: 20,
                  endIndent: 0,
                ),
                Row(
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16, color: Color(0xff394C66)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        "Create Account",
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

  void deneme() {}
}
