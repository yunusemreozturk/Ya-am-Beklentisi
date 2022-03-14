import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/result_page.dart';

import 'icon_gender.dart';
import 'my_container.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String chosenGender = '';
  double smokingCigarette = 15;
  double dayOfSport = 3;
  int height = 170;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('Boy'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('Kilo'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftada Kaç Gün Sporsunuz?',
                    style: kTextStyle,
                  ),
                  Text(
                    '${dayOfSport.toInt()}',
                    style: kNumberStyle,
                  ),
                  Slider(
                    divisions: 7,
                    min: 0,
                    max: 7,
                    value: dayOfSport,
                    onChanged: (double newValue) {
                      setState(() {
                        dayOfSport = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Günde Kaç Sigara İçiyorsunuz?',
                    style: kTextStyle,
                  ),
                  Text(
                    // smokingCigarette.toInt().toString() // farklı bir yolu
                    "${smokingCigarette.toInt()}",
                    style: kNumberStyle,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: smokingCigarette,
                    onChanged: (double newValue) {
                      setState(() {
                        smokingCigarette = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    color: chosenGender == 'Kadın'
                        ? Colors.transparent
                        : Colors.white,
                    onPress: () {
                      setState(() {
                        chosenGender = 'Kadın';
                      });
                    },
                    child: const IconGender(
                      icon: FontAwesomeIcons.venus,
                      gender: 'KADIN',
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    color: chosenGender == 'Erkek'
                        ? Colors.transparent
                        : Colors.white,
                    onPress: () {
                      setState(() {
                        chosenGender = 'Erkek';
                      });
                    },
                    child: const IconGender(
                      icon: FontAwesomeIcons.mars,
                      gender: 'ERKEK',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: FlatButton(
              color: Colors.white,
              child: Text(
                'HESAPLA',
                style: kTextStyle,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      UserData(
                          chosenGender: chosenGender,
                          smokingCigarette: smokingCigarette,
                          dayOfSport: dayOfSport,
                          height: height,
                          weight: weight),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: kTextStyle,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'Kilo' ? '${weight}' : '${height}',
            style: kNumberStyle,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: kPMBorderSize,
                child: const Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'Kilo' ? weight++ : height++;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                borderSide: kPMBorderSize,
                child: const Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
                onPressed: () {
                  setState(() {
                    label == 'Kilo' ? weight-- : height--;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
