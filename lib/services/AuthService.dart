import 'dart:io';
import 'package:auth_laravel/models/user_model.dart';
import 'package:get/get.dart';

class AuthService extends GetConnect {
  Future loginUser(String email, String password) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };
      httpClient.baseUrl = 'http://10.0.2.2:8000/api';
      Response response = await post('/login', data);
      return response.body;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future registerUser(String name, String email, String password) async {
    try {
      Map<String, dynamic> data = {
        'name': name,
        "email": email,
        "password": password,
      };
      if (Platform.isAndroid) {
        httpClient.baseUrl = 'http://10.0.2.2:8000/api';
      } else {
        httpClient.baseUrl = 'http://localhost:8000/api';
      }
      Response response = await post('/register', data);
      return response.body;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> getUserByToken(String token) async {
    if (Platform.isAndroid) {
      httpClient.baseUrl = 'http://10.0.2.2:8000/api';
    } else {
      httpClient.baseUrl = 'http://localhost:8000/api';
    }
    Response response = await get(
      '/user',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      contentType: 'application/json',
    );
    if (response.statusCode != 401) {
      User user = User.fromJson(response.body);
      return user;
    } else {
      return null;
    }
  }

  Future<void> logOut(String token) async {
    if (Platform.isAndroid) {
      httpClient.baseUrl = 'http://10.0.2.2:8000/api';
    } else {
      httpClient.baseUrl = 'http://localhost:8000/api';
    }
    Response response = await get(
      '/logout',
      headers: {
        'Authorization': 'Bearer $token',
      },
      contentType: 'application/json',
    );
    print(response.body);
  }
}
