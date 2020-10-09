import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:instagram_clon_2/utils/simple_snackbar.dart';
import 'package:path/path.dart';

class FirebaseAuthState extends ChangeNotifier {
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.progress;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser _firebaseUser;
  FacebookLogin _facebookLogin;

  void watchAuthChanged() {
    _firebaseAuth.onAuthStateChanged.listen((firebaseUser) {
      if (firebaseUser == null && _firebaseUser == null) {
        changeFirebaseAuthStatus();
        return;
      } else if (firebaseUser != _firebaseUser) {
        _firebaseUser = firebaseUser;
        changeFirebaseAuthStatus();
      }
    });
  }

  void changeFirebaseAuthStatus([FirebaseAuthStatus firebaseAuthStatus]) {
    if (firebaseAuthStatus != null) {
      _firebaseAuthStatus = firebaseAuthStatus;
    } else {
      if (_firebaseUser != null) {
        _firebaseAuthStatus = FirebaseAuthStatus.siginIn;
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.siginOut;
      }
    }
    notifyListeners();
  }

  void signOut() async {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);

    _firebaseAuthStatus = FirebaseAuthStatus.siginOut;
    if (_firebaseUser != null) {
      _firebaseUser = null;
      await _firebaseAuth.signOut();
      if (await _facebookLogin.isLoggedIn) {
        await _facebookLogin.logOut();
      }
    }
    notifyListeners();
  }

  void registerUser(BuildContext context,
      {@required String email, @required String password}) {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);

    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((onError) {
      String _massge;
      switch (onError.code) {
        case 'ERROR_WEAK_PASSWORD':
          _massge = "비밀번호가 잘못 입력되었습니다.";
          break;
        case 'ERROR_INVALID_EMAIL':
          _massge = "이메일이 잘못 입력되었습니다.";
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          _massge = "이미 사용된 이메일입니다.";
          break;
      }
      SnackBar snackBar = SnackBar(
        content: Text(_massge),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void login(BuildContext context,
      {@required String email, @required String password}) {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);

    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((onError) {
      String _massge;
      switch (onError.code) {
        case 'ERROR_INVALID_EMAIL':
          _massge = "이메일을 확인해주세요";
          break;
        case 'ERROR_WRONG_PASSWORD':
          _massge = "비밀번호를 확인해주세요";
          break;
        case 'ERROR_USER_NOT_FOUND':
          _massge = "회원가입된 이메일이 아닙니다.";
          break;
        case 'ERROR_USER_DISABLED':
          _massge = "제한된 이메일입니다.";
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          _massge = "잠시 후 다시 로그인해주세요";
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          _massge = "해당 동작은 금지입니다.";
          break;
      }
      SnackBar snackBar = SnackBar(
        content: Text(_massge),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void loginWithFacebook(BuildContext context) async {
    changeFirebaseAuthStatus(FirebaseAuthStatus.progress);

    if (_facebookLogin == null) {
      _facebookLogin = FacebookLogin();
    }
    final result = await _facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        _handleFacebookTokenWithFirebase(context, result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        simpleSnackbar(context, 'User cancel Facebook login');
        break;
      case FacebookLoginStatus.error:
        simpleSnackbar(context, '로그인 실패!!');
        _facebookLogin.logOut();
        break;
    }
  }

  void _handleFacebookTokenWithFirebase(
      BuildContext context, String token) async {
    final AuthCredential credential =
        FacebookAuthProvider.getCredential(accessToken: token);
    final AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    if (user == null) {
      simpleSnackbar(context, '페북 로그인 실패!');
    } else {
      _firebaseUser = user;
    }
    notifyListeners();
  }

  FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;
}

enum FirebaseAuthStatus { siginIn, siginOut, progress }
