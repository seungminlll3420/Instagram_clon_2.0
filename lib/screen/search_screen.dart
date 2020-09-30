import 'package:flutter/material.dart';
import 'package:instagram_clon_2/widget/rounded_avatar.dart';
import 'package:path/path.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<bool> followings = List.generate(30, (index) => false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: RoundedAvatar(),
              title: Text('username $index'),
              subtitle: Text('user Bio number $index'),
              trailing: InkWell(
                onTap: () {
                  setState(() {
                    if (followings[index]) {
                      followings[index] = false;
                    } else {
                      followings[index] = true;
                    }
                  });
                },
                child: Container(
                  width: 80,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:
                          followings[index] ? Colors.blue[50] : Colors.red[50],
                      border: followings[index]
                          ? Border.all(color: Colors.blue, width: 0.5)
                          : Border.all(color: Colors.red, width: 0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    'Following',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
            );
          },
          itemCount: followings.length),
    );
  }
}
