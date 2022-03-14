import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/calculate.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;

  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sonuç Sayfası',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
                child: Text(
              '${Calculate(_userData).calculation().round()}',
              style: kTextStyle,
            )),
            flex: 8,
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'GERİ DÖN',
                style: kTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
