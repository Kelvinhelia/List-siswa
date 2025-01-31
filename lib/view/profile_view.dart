import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_placeholder.png'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Kelvin Helianto',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'NIS : 22103874',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Email: khelianto@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            Center(
              child: Text(
                'Alamat : Pasirkoja',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
            Center(
              child: Text(
                'Nomor Telepon : 0800000000',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
