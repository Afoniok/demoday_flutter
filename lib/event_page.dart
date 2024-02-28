import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ticket Details",
                style: TextStyle(fontSize: 30),
              ),
              Row(children: [
                Image(
                  width: 120,
                  height: 70,
                  image: AssetImage(
                    "assets/images/events_00_A.jpg",
                  ),
                ),
                Image(
                  width: 120,
                  height: 70,
                  image: AssetImage(
                    "assets/images/events_00_A.jpg",
                  ),
                ),
                Image(
                  width: 120,
                  height: 70,
                  image: AssetImage(
                    "assets/images/events_00_A.jpg",
                  ),
                ),
              ]),
              Text("tgr")
            ],
          ),
        ),
      ),
    );
  }
}
