import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_x_ecommerce/model/user_model.dart';

class FireStoreUser{
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  

  addUserToFireStore(UserModel userModel)async{
     await users.doc(userModel.userId).set(
      
      userModel.toMap()
      );
  }
}