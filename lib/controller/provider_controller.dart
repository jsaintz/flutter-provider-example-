import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Name';
  String imgAvatar = 'https://i.redd.it/59msr0yi6ag41.jpg';
  String birthDate = '(Date)';

  void changeData() {
    name = 'Jonatas Santos';
    imgAvatar = 'https://i.redd.it/59msr0yi6ag41.jpg';
    birthDate = '16/05/1992';
    notifyListeners();
  }
}
