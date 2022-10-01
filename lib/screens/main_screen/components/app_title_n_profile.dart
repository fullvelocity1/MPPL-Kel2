import 'package:flutter/material.dart';
import 'package:krl_info/screens/login/components/app_title.dart';

class AppTitleNProfile extends StatelessWidget {
  const AppTitleNProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        AppTitle(),
        Image(image: AssetImage('assets/images/carbon_user-avatar-filled.png')),
      ],
    );
  }
}
