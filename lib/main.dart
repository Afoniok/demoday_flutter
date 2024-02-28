import 'package:flutter/material.dart';
import 'package:test_app/event_page.dart';
import 'package:test_app/mainn.dart';
import 'package:test_app/navbar.dart';
import 'package:test_app/tickets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventPage(),
    );
  }
}
// void main() {
//   // Sample JSON Data
//   final String sampleJson = '''
//     [
//       {"id": "1", "title": "Task 1", "completed": false},
//       {"id": "2", "title": "Task 2", "completed": true},
//       {"id": "3", "title": "Task 3", "completed": false}
//     ]
//   ''';

//   // Step 3: Flutter Widget to Display Todos with Checkboxes
//   runApp(MyApp(todos: parseTodos(sampleJson)));
// }
