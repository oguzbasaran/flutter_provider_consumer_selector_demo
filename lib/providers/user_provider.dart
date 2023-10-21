import 'package:flutter/foundation.dart';
import 'package:flutter_provider_consumer_selector_demo/models/user.dart';

class UserProvider with ChangeNotifier {
  final User _user = User(username: 'Flutter');

  User get user => _user;

  void toggleOnlineStatus() {
    _user.isOnline = !_user.isOnline;
    notifyListeners();
  }

  void changeUsername(String newName) {
    _user.username = newName;
    notifyListeners();
  }
}
