import 'package:yasam_beklentisi/user_data.dart';

class Calculate {
  final UserData _userData;

  Calculate(this._userData);

  double calculation() {
    double result;

    result = 90 + _userData.dayOfSport - _userData.smokingCigarette;
    result = result + (_userData.height / _userData.height);

    return _userData.chosenGender == 'Kadın' ? result + 3 : result;

    if (_userData.chosenGender == 'Kadın') {
      return result + 3;
    } else {
      return result;
    }
  }
}
