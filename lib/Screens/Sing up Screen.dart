
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Login Screen.dart';

class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key });


  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool passToggle = true;
  bool confirmpassToggle = true;
  var formerKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String? userid ;

  Future addUser({
    required String name ,
    required String phone ,
    required String email ,
    required String age ,
    required String gender
  }) async {

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('users').doc(email).set({
      'name' : name ,
      'phone' : phone ,
      'email' : email,
      'age' : age ,
      'gender' : gender,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key : formerKey,
        child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Lottie.asset('assets/animation_waterSplashl.json'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Name must not be empty";
                        } return null ;},
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Phone Number must not be empty";
                        } else if (value.length < 11) {
                          return " Phone Number must be 11 digit";
                        }
                        return null ;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Phone Number",
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: emailController ,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Email address must not be empty";
                        } else if (!value.contains('@')) {
                          return "Unveiled email address , must contains @ symbol";
                        }
                        return null ;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: passwordController ,
                      obscureText: passToggle ? true : false,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Password must not be empty";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters" ;
                        }
                        return null ;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: InkWell(
                          onTap: () {
                            passToggle = !passToggle ;
                            setState(() {});
                          },
                          child: passToggle
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: confirmPasswordController ,
                      obscureText: confirmpassToggle ? true : false,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Password must not be empty";
                        } else if (value != passwordController.text) {
                          return "Password does not match" ;
                        }
                        return null ;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: InkWell(
                          onTap: () {
                            confirmpassToggle = !confirmpassToggle ;
                            setState(() {});
                          },
                          child: confirmpassToggle
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Age must not be empty";
                        } return null ;},
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Age",
                        prefixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextFormField(
                      controller: genderController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty)  {
                          return "Gender must not be empty";
                        } return null ;},
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Gender",
                        prefixIcon: Icon(Icons.male),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xFF64B5F6) ),
                      child: MaterialButton( onPressed:  () async {
                        if (formerKey.currentState!.validate())  {
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => LoginScreen()),);
                          }).catchError((error) {
                            print(error.toString());
                          });
                          addUser(
                            name : nameController.text ,
                            phone : phoneController.text ,
                            email : emailController.text,
                            age : ageController.text ,
                            gender : genderController.text ,);
                        }
                      } ,
                        child:const Text ("Create Account" , style: TextStyle(color: Colors.white,fontSize: 20)),),
                    ),

                  ),
                  //SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have account?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: const Text('Log In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF64B5F6),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
class passUserData {

  String? userid;
  String? name ;
  String? phone ;
  String? email ;
  String? age ;
  String? gender ;
}
