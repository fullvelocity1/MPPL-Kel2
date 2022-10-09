import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/components/text_field_form.dart';
import 'package:krl_info/screens/login/login_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isHiddenPassword = true;
  bool isHiddenPasswordConf = true;

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
                'Edit Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              // Text Field Nama Regist
              const TextFieldForm(
                title: 'Name',
                hintTxt: 'Masukkan namamu',
              ),
              const SizedBox(
                height: 17,
              ),
              // Text Field Email Regist
              const TextFieldForm(
                title: 'Email',
                hintTxt: 'Masukkan alamat email',
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
                    onPressed: () {},
                    child: const Text("Save",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 14))),
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
