import 'package:omar_flutter/model/user.dart';
import 'package:dio/dio.dart';

User? myUser;

final dio = Dio();
String weather = "0";
String city = "";
void getWeather() async {
  var response = (await dio.get(
    'http://api.weatherapi.com/v1/current.json?key=e3a6705d6d6d42f2907225815233008&q=Egypt&aqi=no',
  ));
  weather = response.data["current"]["temp_c"].toString();
  city = response.data["location"]["name"].toString();
}
