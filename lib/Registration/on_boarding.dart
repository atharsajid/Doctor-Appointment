import 'package:doctor_appointment/Registration/Doctor/login.dart';
import 'package:doctor_appointment/Registration/Patient/login.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                const Text(
                  "Welcome to",
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Doctor 24/7",
                  style: TextStyle(color: Colors.white, fontSize: 43),
                ),
                const SizedBox(
                  height: 35,
                ),
                Image.asset(
                  'assets/logo2.png',
                  height: 100,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(children: [
                const SizedBox(
                  width: double.infinity,
                ),
                const Text(
                  "Continue as",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoctorLogin()));
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blue,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.blue, width: 2),
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    'Doctor',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientLogin()));
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    side: BorderSide.none,
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    'Patient',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       'Sign In',
                //       style: TextStyle(
                //         color: Color(0xff4c505b),
                //         fontSize: 27,
                //         fontWeight: FontWeight.w700,
                //       ),
                //     ),
                //     CircleAvatar(
                //       radius: 30,
                //       backgroundColor: const Color(0xff4c505b),
                //       child: IconButton(
                //         color: Colors.white,
                //         onPressed: () {},
                //         icon: const Icon(Icons.arrow_forward),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 40,
                // ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       TextButton(
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const MyRegister()));
                //         },
                //         child: const Text(
                //           'Sign Up',
                //           style: TextStyle(
                //             decoration: TextDecoration.underline,
                //             fontSize: 18,
                //             color: Color(0xff4c505b),
                //           ),
                //         ),
                //       ),
                //       TextButton(
                //         onPressed: () {},
                //         child: const Text(
                //           'Forgot Password',
                //           style: TextStyle(
                //             decoration: TextDecoration.underline,
                //             fontSize: 18,
                //             color: Color(0xff4c505b),
                //           ),
                //         ),
                //       ),
                //     ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
