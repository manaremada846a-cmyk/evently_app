import 'dart:developer' show log;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

//login
class FirebaseAuthService {
  static Future<UserModel?> login(UserModel user) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: user.email,
            password: user.password!,
          );
      user.id = credential.user?.uid;

      UserModel? userData = await getUserInfo(credential.user!.uid);
      log("sucess");
      return userData!;
    } catch (e) {
      log(">>>>>>>>>--$e");
    }
  }

  //regisret
  static Future<void> register(UserModel user) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password!,
          );

      user.id = credential.user?.uid;
      await creatUser(user);
      log(">>>>>>>>>--success");
    } catch (e) {
      log(">>>>>>>>>$e");
    }
  }

  static CollectionReference<UserModel> getcollections() => FirebaseFirestore
      .instance
      .collection("users")
      .withConverter<UserModel>(
        fromFirestore: (snapshot, options) =>
            UserModel.fromJson(snapshot.data() ?? {}),
        toFirestore: (value, options) => value.toJson(),
      );

  //create user
  static Future creatUser(UserModel user) async {
    CollectionReference<UserModel> collection = getcollections();
    DocumentReference doc = collection.doc(user.id); //using uid

    await doc.set(user);
  }

  //get user info
  static Future<UserModel?> getUserInfo(String id) async {
    CollectionReference<UserModel> collection = getcollections();
    DocumentReference<UserModel> doc = collection.doc(id);
    DocumentSnapshot<UserModel> snapshot = await doc.get();
    return snapshot.data();
  }
}

//delete acount
//login with google

//logout
//forget password
