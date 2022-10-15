import 'package:ebookflutter/presentation/ebooklist_page.dart';
import 'package:ebookflutter/utilities/app_string.dart';
import 'package:ebookflutter/utilities/enum.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Ebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Aplikasi Ebook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                TextButton(onPressed: () => _navigateToEbookListPage(ApiType.dioQT), child: const Text('Ebook List')),

              ],
            ),
          )
        ],
      ),
    );
  }

  void _navigateToEbookListPage(ApiType type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EbookListPage(type: type),
      ),
    );
  }
}
