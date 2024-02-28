import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:async';

class MyEvents extends StatelessWidget {
  const MyEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Events List',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/events_data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
      print("..number of items ${_items.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Events List',
        ),
      ),
      body: Column(
        children: [
          _items.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Card(
                          key: ValueKey(_items[index]["id"]),
                          margin: const EdgeInsets.all(10),
                          color: Colors.amber.shade100,
                          child: ListTile(
                            leading: Image(
                              image: AssetImage(
                                "assets/images/events_00_A.jpg",
                              ),
                            ),
                            // leading: Image.asset(_items[index]["eventPictures"]),
                            title: Text(_items[index]["eventTitle"]),
                            subtitle: Text(_items[index]["eventText"]),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    readJson();
                  },
                  child: Center(child: Text("Start")))
        ],
      ),
    );
  }
}
