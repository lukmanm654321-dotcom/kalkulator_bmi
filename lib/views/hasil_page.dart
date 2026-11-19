import 'package:flutter/material.dart';

import '../models/hasil_bmi.dart';

class HasilPage extends StatelessWidget {
  final HasilBmi hasil;

  const HasilPage({super.key, required this.hasil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil BMI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text('Nilai BMI', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(
                      hasil.nilai.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      hasil.kategori.nama,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.lightbulb_outline),
                title: const Text('Saran'),
                subtitle: Text(hasil.kategori.saran),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Hitung Lagi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}