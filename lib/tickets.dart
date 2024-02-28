import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  @override
  _MyApState createState() => _MyApState();
}

class _MyApState extends State<Tickets> {
  List<Person> persons = [];

  List<ClosePerson> closepersons = [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    persons.add(Person(
        id: "1", name: "Hari Prasad Chaudhary", address: "Kathmandu, Nepal"));
    persons
        .add(Person(id: "2", name: "Krishna Karki", address: "Pokhara, Nepal"));
    persons.add(
        Person(id: "3", name: "Ujjwal Joshi", address: "Bangalore, India"));
    persons.add(Person(
        id: "4", name: "Samir Hussain Khan", address: "Karachi, Pakistan"));

    closepersons.add(ClosePerson(
        id: "1", name: "Hari Prasad Chaudhary", address: "Kathmandu, Nepal"));
    closepersons.add(
        ClosePerson(id: "2", name: "Krishna Karki", address: "Pokhara, Nepal"));
    closepersons.add(ClosePerson(
        id: "3", name: "Ujjwal Joshi", address: "Bangalore, India"));
    closepersons.add(ClosePerson(
        id: "4", name: "Samir Hussain Khan", address: "Karachi, Pakistan"));

    super.initState();
  }

  void adidng() {
    persons.add(Person(
        id: "4", name: "Samir Hussain Khan", address: "Karachi, Pakistan"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: adidng,
                child: Container(
                  width: 200,
                  height: 70,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 87, 61),
                      borderRadius: BorderRadius.circular(9.0)),
                  child: Center(
                    child: Text(
                      "Create a new ticket",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Opening ceromony tickets",
                      style: TextStyle(fontSize: 25),
                    ),
                    Column(
                      children: persons.map((personone) {
                        return Container(
                          child: Card(
                            child: ListTile(
                              title: Text(personone.name),
                              subtitle: Text(personone.address),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent),
                                child: Icon(Icons.delete),
                                onPressed: () {
                                  persons.removeWhere((element) {
                                    return element.id == personone.id;
                                  });
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Closing ceromony tickets",
                      style: TextStyle(fontSize: 25),
                    ),
                    Column(
                      children: persons.map((personone) {
                        return Container(
                          child: Card(
                            child: ListTile(
                              title: Text(personone.name),
                              subtitle: Text(personone.address),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent),
                                child: Icon(Icons.delete),
                                onPressed: () {
                                  persons.removeWhere((element) {
                                    return element.id == personone.id;
                                  });
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Person {
  String id, name, address;
  Person({required this.id, required this.name, required this.address});
}

class ClosePerson {
  String id, name, address;
  ClosePerson({required this.id, required this.name, required this.address});
}
