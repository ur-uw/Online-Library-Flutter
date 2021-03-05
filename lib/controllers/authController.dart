import 'package:auth_laravel/models/user_model.dart';
import 'package:auth_laravel/services/AuthService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

const IS_LOGGED_IN = 'isLoggedIn';

class AuthController extends GetxController {
  AuthService _auth = AuthService();
  FlutterSecureStorage _storage = FlutterSecureStorage();
  Rx<User> _currentUser = Rx<User>();
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  User get currentUsr => _currentUser.value;
  String _token;
  String get getToken => _token;

  Future<bool> checkIfUserIsLogged() async {
    var isLogged = await _storage.read(key: IS_LOGGED_IN);
    if (isLogged != null && isLogged == 'yes') {
      return true;
    }
    return false;
  }

  set setCurrentUser(User user) {
    _currentUser.value = user;
  }

  set setLoginState(String state) {
    _storage.write(key: IS_LOGGED_IN, value: state);
  }

  set setToken(String token) {
    _token = token;
    _storage.write(key: 'token', value: token);
  }

  @override
  void onInit() async {
    var isLogged = await _storage.read(key: IS_LOGGED_IN);
    if (isLoggedIn != null && isLogged == 'yes') {
      _isLoggedIn = true;
      var token = await _storage.read(key: 'token');
      _token = token;
      _currentUser.value = await _auth.getUserByToken(token);
    }
    super.onInit();
  }
}
