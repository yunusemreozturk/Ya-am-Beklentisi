import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/constants.dart';

class IconGender extends StatelessWidget {
  final IconData icon;
  final String gender;

  const IconGender(
      {Key? key,
      this.gender = 'Default',
      this.icon = FontAwesomeIcons.venusMars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: kTextStyle,
        ),
      ],
    );
  }
}
