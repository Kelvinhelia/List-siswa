import 'package:flutter/material.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final List<Map<String, String>> history = [
    {'name': 'Kelvin Helianto', 'date': '2024-01-10'},
    {'name': 'Jose Antonio', 'date': '2024-01-11'},
    {'name': 'Bimskuy', 'date': '2024-01-12'},
    {'name': 'Ikhsan', 'date': '2024-01-13'},
    {'name': 'Kevin', 'date': '2024-01-14'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.orange),
              title: Text(history[index]['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              subtitle: Text('Terakhir diakses : ${history[index]['date']}'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () {
                  // Navigate to history details page (to be implemented)
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
