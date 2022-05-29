import 'package:doctor_appointment/Doctor%20Screen/appointment.dart';
import 'package:doctor_appointment/Doctor%20Screen/pending_request.dart';
import 'package:doctor_appointment/Doctor%20Screen/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          backgroundColor: Colors.blue,
          elevation: 0,
          bottom: TabBar(tabs: [
            Column(
              children: const [
                Icon(
                  Icons.apps,
                ),
                Text("Appointement"),
              ],
            ),
            Column(
              children: const [
                Icon(
                  Icons.alarm,
                ),
                Text('Schedule'),
              ],
            ),
            Column(
              children: const [
                Icon(Icons.pending),
                Text("Pending Request"),
              ],
            ),
          ]),
        ),
        body: const TabBarView(children: [
          Appointment(),
          Schedule(),
          PendingRequest(),
        ]),
      ));
}
