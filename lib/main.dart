import 'package:flutter/material.dart';
import 'package:instagram_clon_2/home_page.dart';
import 'package:instagram_clon_2/model/firebase_auth_state.dart';
import 'package:instagram_clon_2/screen/auth_screen.dart';
import 'package:instagram_clon_2/screen/profile_screen.dart';
import 'package:instagram_clon_2/widget/my_progress_indicator.dart';
import 'package:provider/provider.dart';

import 'constants/material_White.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  FirebaseAuthState _firebaseAuthState = FirebaseAuthState();
  Widget _currentWidget;
  @override
  Widget build(BuildContext context) {
    _firebaseAuthState.watchAuthChanged();
    return ChangeNotifierProvider.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: white),
        home: Consumer<FirebaseAuthState>(
          builder: (BuildContext context, FirebaseAuthState firebaseAuthState,
              Widget child) {
            switch (firebaseAuthState.firebaseAuthStatus) {
              case FirebaseAuthStatus.siginIn:
                _currentWidget = HomePage();
                break;
              case FirebaseAuthStatus.siginOut:
                _currentWidget = AuthScreen();
                break;
              default:
                _currentWidget = MyProgressIndicator();
                break;
            }
            return AnimatedSwitcher(
              child: _currentWidget,
              duration: duration,
            );
          },
        ),
      ),
    );
  }
}
