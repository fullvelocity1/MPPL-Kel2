import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/register_screen.dart';
import 'components/text_field_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
              width: size.width,
              child: Column(
                children: <Widget>[
                  // Page Title
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  // Text Field Email
                  const TextFieldForm(
                    title: 'Email',
                    hintTxt: 'Masukkan alamat email',
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  // Text Field Password
                  textFieldFormPassword("Password", "Masukkan Password"),
                  const SizedBox(
                    height: 43,
                  ),
                  // Button Login
                  SizedBox(
                    width: size.width,
                    height: 48,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(color: primColor)))),
                        onPressed: () {},
                        child: const Text("Login Now",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 14))),
                  ),
                  // Regist Text Suggestion
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()),
                            );
                          },
                          child: const Text(
                            " Register Now",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // App Icon
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Image(
                        image:
                            AssetImage('assets/images/carbon_train-heart.png')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column textFieldFormPassword(title, hintTxt) {
    return Column(
      children: <Widget>[
        // Title Text Field
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        // Text Field
        TextField(
          obscureText: isHiddenPassword,
          decoration: InputDecoration(
            suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: const Icon(Icons.visibility)),
            contentPadding:
                const EdgeInsets.only(left: 23, top: 15, bottom: 15),
            hintText: hintTxt,
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
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
