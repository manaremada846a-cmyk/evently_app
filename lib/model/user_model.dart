 
class UserModel {
  
  String ?id;
    String ?name;
  String email;
  String ?password;
    String ?rePassword;
  UserModel(  {required this.email,this.name,this.id,this.rePassword, this.password});

 Map<String,dynamic> toJson(){
  return {
    "name":name,
   "email": email
  };
 }
 static UserModel fromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'] ?? '',
    password: json['password'],
  );
}

}
