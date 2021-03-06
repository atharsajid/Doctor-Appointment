import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/Registration/Doctor/login.dart';
import 'package:doctor_appointment/data/json.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoctorRegistor extends StatefulWidget {
  const DoctorRegistor({Key? key}) : super(key: key);

  @override
  _DoctorRegistorState createState() => _DoctorRegistorState();
}

class _DoctorRegistorState extends State<DoctorRegistor> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController specialitycontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "Create\nAccount",
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Column(children: [
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Name',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        controller: specialitycontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintText: 'Speciality',
                          hintStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: experiencecontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          hintText: 'Experience',
                          hintStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            if (namecontroller.text.isNotEmpty &&
                                emailcontroller.text.isNotEmpty &&
                                specialitycontroller.text.isNotEmpty &&
                                experiencecontroller.text.isNotEmpty &&
                                passcontroller.text.isNotEmpty) {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: emailcontroller.text,
                                            password: passcontroller.text);
                                doctor();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Your account created successfully"),
                                  ),
                                );
                                namecontroller.clear();
                                emailcontroller.clear();
                                passcontroller.clear();
                                specialitycontroller.clear();
                                experiencecontroller.clear();
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'The password provided is too weak.'),
                                    ),
                                  );
                                } else if (e.code == 'email-already-in-use') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'The account already exists for that email.'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                print(e);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("All Fields are required"),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoctorLogin()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  doctor() async {
    await FirebaseFirestore.instance
        .collection("Doctor")
        .doc(emailcontroller.text)
        .set({
      "Name": namecontroller.text,
      "Email": emailcontroller.text,
      'Speciality': specialitycontroller.text,
      'Experience': experiencecontroller.text,
      'PhotoUrl': chatsData[1]["image"].toString(),
    });
  }
}
