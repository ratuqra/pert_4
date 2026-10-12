import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App logo
                const SizedBox(
                  width: 140,
                  height: 140,
                  child: Icon(Icons.school, size: 140, color: Colors.blue),
                ),
                const SizedBox(height: 32),
                Text(
                  'Aplikasi Profile Mahasiswa',
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Belajar Navigasi Di Flutter',
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
