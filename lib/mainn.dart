import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/library_page%20(3).dart';
import 'package:test_app/library_provider%20(4).dart';

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryProvider(), // Providing FormDataProvider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LibraryPage(),
      ),
    );
  }
}
