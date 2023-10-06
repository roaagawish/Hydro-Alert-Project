import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UserModel {

  String? email;
  String? name;
  String? phone;
  String? age;
  String? gender;


  UserModel({this.email, this.name, this.phone, this.age, this.gender,} );

  Map<String, dynamic> toJason() =>
      {
        'name': name,
        'phone': phone,
        'email': email,
        'age': age,
        'gender': gender,
      };


  factory UserModel.fromJason(Map<String, dynamic> jason) =>
      UserModel(
        name: jason["name"] == null ? null : jason["name"],
        email: jason["email"] == null ? null : jason["email"],
        phone: jason["phone"] == null ? null : jason["phone"],
        age: jason["age"] == null ? null : jason["age"],
        gender: jason["gender"] == null ? null : jason["gender"],
      );


}

class UserModelProvider {


  UserModel? userModel;
  String? user = FirebaseAuth.instance.currentUser!.email!;


  Future<UserModel?> getUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user)
        .get()
        .then((value) {
      userModel = UserModel.fromJason(value.data()!);
      print("****************************************************");
      print(userModel);
      print(value.data());
      print("****************************************************");
    }
    );
    return userModel;
  }
}