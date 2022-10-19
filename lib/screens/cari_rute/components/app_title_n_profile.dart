import 'package:flutter/material.dart';
import 'package:krl_info/screens/login/components/app_title.dart';
import 'package:krl_info/screens/profile/profile_edit.dart';
import 'package:krl_info/screens/profile/profile_info.dart';

class AppTitleNProfile extends StatelessWidget {
  const AppTitleNProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const AppTitle(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileInfo()),
            );
          },
          child: const Image(
            image: AssetImage('assets/images/carbon_user-avatar-filled.png'),
          ),
        ),
      ],
    );
  }
}
