import 'package:flutter/material.dart';
import 'package:krl_info/constants.dart';
import 'package:krl_info/screens/login/register_screen.dart';
import 'components/app_title.dart';
import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: <Widget>[
        // First Screen Picture
        Expanded(
          flex: 3,
          child: Container(
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/trainImage.png'))),
          ),
        ),
        // Login or Register
        Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 31),
                child: Column(children: const <Widget>[
                  AppTitle(),
                  SizedBox(height: 15),
                  DescriptionText(),
                  SizedBox(height: 35),
                  LoginButton(),
                  SizedBox(height: 16),
                  RegistButton(),
                ]),
              ),
            ))
      ]),
    );
  }
}

class RegistButton extends StatelessWidget {
  const RegistButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 48,
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(primColor),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: primColor)))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Register()),
            );
          },
          child: const Text("Register Now",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 14))),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 48,
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(primColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(color: primColor)))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          child: const Text("Login Now",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 14))),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Temukan rute KRL terbaik dan dapatkan info-info stasiun KRL yang belum kamu ketahui disini!',
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
      ),
    );
  }
}
