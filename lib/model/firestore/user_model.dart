import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clon_2/constants/firestore_keys.dart';

class UserModel {
  final String userKey;
  final String profileImg;
  final String email;
  final List<dynamic> myPosts;
  final int followers;
  final List<dynamic> likePosts;
  final String username;
  final List<dynamic> following;
  final DocumentReference reference;

  UserModel.fromMap(Map<String, dynamic> map, this.userKey, {this.reference})
      : profileImg = map[KEY_PROFILEIMG],
        username = map[KEY_USERNAME],
        email = map[KEY_EMAIL],
        likePosts = map[KEY_LIKEDPOSTS],
        followers = map[KEY_FOLLOWERS],
        following = map[KEY_FOLLOWINGS],
        myPosts = map[KEY_MYPOSTS];

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, snapshot.documentID,
            reference: snapshot.reference);

  static Map<String, dynamic> getMapForCreateUser(String email) {
    Map<String, dynamic> map = Map();
    map[KEY_PROFILEIMG] = "";
    map[KEY_USERNAME] = email.split('@')[0];
    map[KEY_EMAIL] = email;
    map[KEY_LIKEDPOSTS] = [];
    map[KEY_FOLLOWERS] = 0;
    map[KEY_FOLLOWINGS] = [];
    map[KEY_MYPOSTS] = [];
    return map;
  }
}
