import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/login_screen.dart';

import 'components/text_field_form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isHiddenPassword = true;
  bool isHiddenPasswordConf = true;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
          width: size.width,
          child: Column(
            children: <Widget>[
              // Page Title
              const Text(
                'Register Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              // Text Field Nama Regist
              TextFieldForm(
                title: 'Name',
                hintTxt: 'Masukkan namamu',
                controller: nameController,
              ),
              const SizedBox(
                height: 17,
              ),
              // Text Field Email Regist
              TextFieldForm(
                title: 'Email',
                hintTxt: 'Masukkan alamat email',
                controller: emailController,
              ),
              const SizedBox(
                height: 17,
              ),
              // Text Field Password Regist
              Column(
                children: <Widget>[
                  // Title Text Field
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  // Text Field
                  TextField(
                    controller: passwordController,
                    obscureText: isHiddenPassword,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: const Icon(Icons.visibility)),
                      contentPadding:
                          const EdgeInsets.only(left: 23, top: 15, bottom: 15),
                      hintText: "Masukkan password",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(37, 37, 37, 0.04),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              // Text Field Password Confirmation Regist
              Column(
                children: <Widget>[
                  // Title Text Field
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password Confirmation",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  // Text Field
                  TextField(
                    controller: passwordConfController,
                    obscureText: isHiddenPasswordConf,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: _togglePasswordConfView,
                          child: const Icon(Icons.visibility)),
                      contentPadding:
                          const EdgeInsets.only(left: 23, top: 15, bottom: 15),
                      hintText: "Masukkan konfirmasi password",
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(37, 37, 37, 0.04),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 43,
              ),
              // Button Regist
              SizedBox(
                width: size.width,
                height: 48,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(color: primColor)))),
                    onPressed: () {
                      signUp();
                    },
                    child: const Text("Register Account",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 14))),
              ),
              // Login Text Suggestion
              Container(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color.fromRGBO(14, 14, 14, 0.54),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        " Login Now",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image(
                    image: AssetImage('assets/images/carbon_train-heart.png')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    print(emailController.text.trim());
    print(passwordController.text.trim());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      var snackbar = SnackBar(
        content: Text(e.message!),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    var snackbar = SnackBar(
      content: Text('Register Berhasil!'),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Future.delayed(
        const Duration(seconds: 1),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            ));
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _togglePasswordConfView() {
    setState(() {
      isHiddenPasswordConf = !isHiddenPasswordConf;
    });
  }
}
