import 'package:flutter/foundation.dart';
import 'package:instagram_clon_2/model/firestore/user_model.dart';

class UserModelState extends ChangeNotifier {
  UserModel _userModel;
  UserModel get userModel => _userModel;
  set userModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
