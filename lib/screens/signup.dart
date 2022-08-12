import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/signup_cubit.dart';
import 'package:news_app/cubit/signup_states.dart';

import '../layout/news_layout.dart';
import 'login.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  int currentindex = 0;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<signupCubit, signupStates>(
      listener: (context, state) {
        if (state is getsignupdatasucssesstate) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => newslayout()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                      child: Icon(
                    Icons.trending_up,
                    size: 150,
                    color: Colors.blue,
                  )),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 35,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => login()),
                          );
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'already logged in?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter a valid text";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "name",
                      prefix: Icon(
                        Icons.drive_file_rename_outline,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter a valid text";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefix: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obscureText,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter a valid text";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "password",
                      prefix: Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                      suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              obscureText=!obscureText;
                            });
                          },
                          child: obscureText
                              ? Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                              : Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter a valid text";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "mobile",
                      prefix: Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    signupCubit.get(context).usersignup(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                        );
                  },
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 150, vertical: 25),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
