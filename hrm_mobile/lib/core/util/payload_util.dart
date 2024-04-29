// ignore_for_file: empty_catches

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayloadUtil {
  Future<String> getUserId() async {
    String userId = "";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("accessToken");
      if (token != null) {
        if (JwtDecoder.tryDecode(token) != null) {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
          userId = decodedToken['user']['userId'];
        }
      }
    } catch (error) {
      print(error);
    }
    return userId;
  }

  Future<List<dynamic>> getRoleModel() async {
    List<dynamic> roles = [];
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("accessToken");
      if (token != null) {
        if (JwtDecoder.tryDecode(token) != null) {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
          roles =  decodedToken['user']['roles'];
        }
      }
    } catch (error) {
      print(error);
    }
    return roles;
  }
}
