import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/first_screen.dart';
import 'package:krl_info/screens/profile/profile_info.dart';

import '../login/auth.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isHiddenPassword = true;
  bool isHiddenPasswordConf = true;
  final controller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Default text nama
    _controllerName.text = user!.displayName!;
    // Default text email
    _controllerEmail.text = user!.email!;
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
                      'Edit Profile',
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
              // Text Field Nama Regist
              Column(
                children: <Widget>[
                  // Title Text Field
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name',
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
                    //controller: widget.controller,
                    controller: _controllerName,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 23, top: 15, bottom: 15),
                        hintText: 'Masukkan nama',
                        hintStyle: const TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(37, 37, 37, 0.04)),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              // Text Field Email Regist
              Column(
                children: <Widget>[
                  // Title Text Field
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
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
                    //controller: widget.controller,
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 23, top: 15, bottom: 15),
                        hintText: 'Masukkan alamat email',
                        hintStyle: const TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(37, 37, 37, 0.04)),
                  ),
                ],
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
                      "Current Password",
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
                    controller: _controllerPassword,
                    obscureText: isHiddenPassword,
                    decoration: InputDecoration(
                      errorText: _errorText,
                      suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: const Icon(Icons.visibility)),
                      contentPadding:
                          const EdgeInsets.only(left: 23, top: 15, bottom: 15),
                      hintText: "Masukkan password untuk edit profil",
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
              // // Text Field Password Confirmation Regist
              // Column(
              //   children: <Widget>[
              //     // Title Text Field
              //     const Align(
              //       alignment: Alignment.topLeft,
              //       child: Text(
              //         "Password Confirmation",
              //         style: TextStyle(
              //           fontSize: 14,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 13,
              //     ),
              //     // Text Field
              //     TextField(
              //       obscureText: isHiddenPasswordConf,
              //       decoration: InputDecoration(
              //         suffixIcon: InkWell(
              //             onTap: _togglePasswordConfView,
              //             child: const Icon(Icons.visibility)),
              //         contentPadding:
              //             const EdgeInsets.only(left: 23, top: 15, bottom: 15),
              //         hintText: "Masukkan konfirmasi password",
              //         hintStyle: const TextStyle(fontSize: 16),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //           borderSide: const BorderSide(
              //             width: 0,
              //             style: BorderStyle.none,
              //           ),
              //         ),
              //         filled: true,
              //         fillColor: const Color.fromRGBO(37, 37, 37, 0.04),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 43,
              ),
              // Button Save
              SizedBox(
                width: size,
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
                      if (_controllerPassword.value.text.isNotEmpty) {
                        editProf();
                      }
                    },
                    child: const Text("Save",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 14))),
              ),
              const SizedBox(height: 28),
              // Button Hapus Akun
              SizedBox(
                width: size,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade100),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () {
                    openDialogDelAcc();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Image(
                          height: 18,
                          image: AssetImage('assets/images/delete.png'),
                        ),
                        Text("Hapus Akun",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 14)),
                      ],
                    ),
                  ),
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

  Future openDialogDelAcc() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: const Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "Konfirmasi Hapus Akun",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          content: const Text(
            "Apakah kamu yakin ingin menghapus akunmu?",
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
                      FirebaseAuth.instance.currentUser!.delete();
                      var snackbar = SnackBar(
                        content: Text('Delete Account Berhasil!'),
                        backgroundColor: Colors.green,
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Auth()));
                      });
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

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _controllerPassword.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Password tidak bisa kosong';
    }
    if (text.length < 6) {
      return 'Password terlalu pendek';
    }
    // return null if the text is valid
    return null;
  }

  Future<void> editProf() async {
    var user = FirebaseAuth.instance.currentUser!;
    try {
      var password = _controllerPassword.text.trim();
      var nextEmail = _controllerEmail.text.trim();
      var currentEmail = FirebaseAuth.instance.currentUser!.email;
      // Check if old email and password is correct
      var check = await reauthenticateWithCredential(currentEmail!, password);
      if (check == 0) {
        var snackbar = SnackBar(
          content: Text('Password Salah!'),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        return;
      }
      await FirebaseAuth.instance.currentUser!.updateEmail(nextEmail);
      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(_controllerName.text.trim());

      var reauth = await reauthenticateWithCredential(nextEmail, password);
    } on FirebaseAuthException catch (e) {
      // print(e);

      var snackbar = SnackBar(
        content: Text(e.message!),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return;
    }
    var snackbar = SnackBar(
      content: Text('Edit Profile Berhasil!'),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileInfo()),
      );
    });
  }

  Future<int> reauthenticateWithCredential(
      String email, String password) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await user!.reauthenticateWithCredential(credential);
      return 1;
    } on Exception catch (e) {
      // Handle exceptions
      var snackbar = SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return 0;
    }
  }
}
