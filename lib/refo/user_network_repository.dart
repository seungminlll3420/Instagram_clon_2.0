import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clon_2/constants/firestore_keys.dart';
import 'package:instagram_clon_2/model/firestore/user_model.dart';

class UsernetworkRepository {
  Future<void> attemptCreateUser({String userKey, String email}) async {
    final DocumentReference userRef =
        Firestore.instance.collection(COLLECTION_USERS).document(userKey);

    DocumentSnapshot snapshot = await userRef.get();
    if (!snapshot.exists) {
      return userRef.setData(UserModel.getMapForCreateUser(email));
    }
  }
}

UsernetworkRepository userNetworkRepository = UsernetworkRepository();
