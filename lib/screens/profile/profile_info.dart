import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/auth.dart';
import 'package:krl_info/screens/login/components/text_field_form.dart';
import 'package:krl_info/screens/login/first_screen.dart';
import 'package:krl_info/screens/profile/profile_edit.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  bool isHiddenPassword = true;
  bool isHiddenPasswordConf = true;
  final user = FirebaseAuth.instance.currentUser!;

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Default text nama
    _controllerName.text = user.displayName!;
    // Default text email
    _controllerEmail.text = user.email!;
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 50),
          width: size,
          child: Column(
            children: <Widget>[
              // Page Title
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              // Text Field Nama Profile
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                height: 48,
                width: size,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color.fromRGBO(37, 37, 37, 0.04)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      // "Ini Nama User",
                      _controllerName.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              // Text Field Email Profile
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                height: 48,
                width: size,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color.fromRGBO(37, 37, 37, 0.04)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      // "iniemailuser@gmail.com",
                      _controllerEmail.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              // Text Field Password Profile
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
              Container(
                height: 48,
                width: size,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Color.fromRGBO(37, 37, 37, 0.04)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "*********",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              // Edit Profile Button
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 115,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()),
                      );
                      setState(() {});
                    },
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 38),
              // Logout Button
              InkWell(
                onTap: () {
                  openDialog();
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(children: const <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Image(
                            height: 16,
                            image: AssetImage('assets/images/logout.png')),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image(
                          height: 14,
                          image: AssetImage('assets/images/arrow_black.png')),
                    ),
                  ]),
                ),
              ),
              // App icon
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

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: const Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "Konfirmasi Logout",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          content: const Text(
            "Apakah kamu yakin ingin keluar dari aplikasi?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 115,
                  height: 40,
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
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Auth()));
                    },
                    child: const Text(
                      "Ya",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  width: 115,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade200),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Tidak",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      );

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
