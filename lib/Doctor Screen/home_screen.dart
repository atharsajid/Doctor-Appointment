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
          bottom: const TabBar(tabs: [
            Text("Appointement"),
            Text('Schedule'),
            Text("Pending Request"),
          ]),
        ),
      ));
}
