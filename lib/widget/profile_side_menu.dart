import 'package:flutter/material.dart';
import 'package:instagram_clon_2/screen/auth_screen.dart';

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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AuthScreen(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
