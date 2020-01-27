import 'package:administrador/User/model/user_adm_model.dart';
import 'package:administrador/User/services/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  void updateUserDataFirestore(UserAdmin user) =>
      _cloudFirestoreApi.updateUserData(user);
}
