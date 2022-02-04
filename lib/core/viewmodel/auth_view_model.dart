import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:get_x_ecommerce/core/services/fire_store_user.dart';
import 'package:get_x_ecommerce/model/user_model.dart';
import 'package:get_x_ecommerce/view/home_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get auth => _auth;
  String? email, password, name, phone;

  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  //Firebase referes

  @override
  void onInit() {
    // TODO: implement onInit
    _user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void googleSignInMethod() async {
    try {
      final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user);
        Get.offAll(HomeView());
      });
    } catch (error) {
      print(error);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((value) => Get.offAll(HomeView()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((user) async {
        saveUser(user);
        Get.offAll(HomeView());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user!.uid,
        email: email ?? user.user!.email,
        password: password,
        name: name ?? user.user!.displayName,
        phone: phone);

    await FireStoreUser().addUserToFireStore(userModel);
  }
}
