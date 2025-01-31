import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('https://test123.alapalap.fun/api/student');
    await http.get(url).then((response) async {
      var jsonData = jsonDecode(response.body);
      setState(() => data = jsonData['data']);
    });
  }

  final List<String> students = [
    'Kelvin Helianto',
    'Jose Antonio',
    'Bimskuy',
    'Ikhsan',
    'Kevin',
    'Pria Misterius',
    'Banteng',
    'Poroo',
    'Hendi',
    'Nanda'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siswa SMK PI'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(students[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: const Text('XII PPLG'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () {
                  // Navigate to student details page (to be implemented)
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
