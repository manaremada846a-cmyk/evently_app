class UserModel {
  String ?id;
    String ?name;
  String email;
  String password;
    String ?rePassword;
  UserModel(  {required this.email,this.name,this.id,this.rePassword, required this.password});
}
