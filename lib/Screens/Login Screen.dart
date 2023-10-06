import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hydro_alert/Screens/Route%20Screen.dart';
import 'package:lottie/lottie.dart';
import 'Sing up Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool passToggle = true;
  var formerKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Form(
        key : formerKey,
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Lottie.asset('assets/animation_waterball.json'),
                  ),
                  const SizedBox(
                    height: 10,
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
                        labelText :'Email Address',
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                    ),
                  ),
                  //SizedBox(height: 0,),
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
                          return "Password is too short" ;
                        }
                        return null ;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText : 'Password',
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child : Container(
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xFF64B5F6)),
                      child: MaterialButton(onPressed:  () async {
                        if (formerKey.currentState!.validate())  {
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                              .then((value) {
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => const RouteScreen()));
                          }).catchError((error) {
                            print(error.toString());
                          });
                        }
                      } ,
                        child:const Text ("Log In" , style: TextStyle(color: Colors.white,fontSize: 25)),),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have any account?",
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
                                builder: (context) => SignupScreen(),
                              ));
                        },
                        child: const Text('Create account',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF64B5F6),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
