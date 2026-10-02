import 'package:flutter/material.dart';

import '../services/session_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // cek sesi yang tersimpan
  Future<void> checkSession() async {
    // tunggu 3 detik
    await Future.delayed(const Duration(seconds: 3));

    // buat variable untuk data status login
    final isLogin = await SessionService.isLogin();
    if (!mounted) return;

    // cek apakah sudah login
    if (isLogin) {
      // pindah ke halaman home
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // pindah ke halaman login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F172A), // Slate Dark Top
              Color(0xFF1E293B), // Slate Dark Bottom
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Container Logo dengan Efek Shadow & Glassmorphism/Card Modern
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe7nZmTBFb69uSOZAxD-88posAIWPsd6AbJ4HmMf4cKA&s=10',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Nama Aplikasi (Opsional)
              const Text(
                'Tokoku',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),

              const Spacer(),

              // Indikator Loading Modern
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
              ),

              const SizedBox(height: 16),

              // Versi / Footer halus
              Text(
                'v1.0.0',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12,
                  letterSpacing: 1.0,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
