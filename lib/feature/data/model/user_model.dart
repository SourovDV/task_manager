class UserModel{
  String ? email;
  String ? firstName;
  String ? lastName;
  String ? mobile;

  UserModel.fromJson(Map<String,dynamic> json){
    email = json["email"];
    firstName = json["firstName"];
    lastName=json["lastName"];
    mobile = json["mobile"];
  }

   Map<String,dynamic> toJson(){
     return{
        "email":email,
       "firstName":firstName,
       "lastName":lastName,
       "mobile":"mobile"
     };
  }

}