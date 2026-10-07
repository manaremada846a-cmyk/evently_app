import 'package:evently_app/model/user_model.dart';
  import 'package:firebase_auth/firebase_auth.dart';
 

//login
class FirebaseAuthService {

  Future<UserCredential> login(UserModel loginModel) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginModel.email,
      password: loginModel.password,
    );
  }

  Future<UserCredential> registration(UserModel registration) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registration.email,
      password: registration.password,
    );
  }
}


//user info
//delete acount
//login with google

//logout
//forget password


