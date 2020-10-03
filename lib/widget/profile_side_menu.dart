import 'package:flutter/material.dart';
import 'package:instagram_clon_2/model/firebase_auth_state.dart';
import 'package:instagram_clon_2/screen/auth_screen.dart';
import 'package:provider/provider.dart';

class ProfileSideMenu extends StatelessWidget {
  final menuwidth;

  const ProfileSideMenu(this.menuwidth, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: menuwidth,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
              title: Text('Sign out'),
              onTap: () {
                Provider.of<FirebaseAuthState>(context, listen: false)
                    .signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
