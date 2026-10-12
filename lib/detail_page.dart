import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: colorScheme.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _InfoTile(
                        icon: Icons.school,
                        label: 'Nama',
                        value: 'Ratu Qolbu Maziah',
                      ),
                      _InfoTile(
                        icon: Icons.card_membership,
                        label: 'NIM',
                        value: '152024151',
                      ),
                      _InfoTile(
                        icon: Icons.book,
                        label: 'Program Studi',
                        value: 'Informatics',
                      ),
                      _InfoTile(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: 'ratu.qolbu@mhs.itenas.ac.id',
                      ),
                      _InfoTile(
                        icon: Icons.note,
                        label: 'Tentang Saya',
                        value: 'Saya adalah mahasiswi semester awal yang baru pertama kali belajar flutter',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(icon, color: Colors.blue, size: 30),
      title: Text(
        label,
        style: TextStyle(color: colorScheme.onSurfaceVariant, fontSize: 13),
      ),
      subtitle: Text(
        value,
        style: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
