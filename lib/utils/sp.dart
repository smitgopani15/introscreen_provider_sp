import 'package:shared_preferences/shared_preferences.dart';

class Sp {
  Future<void> saveSp(bool check) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("check", check);
  }

  Future<Map> readSp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? check = sp.getBool("check");
    Map m1 = {"check": check};
    return m1;
  }
}
