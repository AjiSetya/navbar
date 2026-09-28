import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Email')),

            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // membuat data diri
                Map<String, dynamic> dataDiri = {
                  'name': 'Aji Setya',
                  'age': 20,
                  'role': 'admin',
                };

                // menggantikan halaman login dengan halaman home
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: {
                    'data': dataDiri,
                    'sesi': true,
                    'tanggal': '2 Agustus 2023',
                  },
                );
              },
              child: const Text('Login'),
            ),

            TextButton(
              onPressed: () {
                // berpindah ke halaman register
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Belum punya akun? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
