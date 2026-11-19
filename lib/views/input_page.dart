import 'package:flutter/material.dart';

import '../controllers/bmi_controller.dart';
import '../widgets/bmi_text_field.dart';
import 'hasil_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  final _tinggiCtrl = TextEditingController();
  final _beratCtrl = TextEditingController();
  final _controller = BmiController();
  bool _loading = false;

  @override
  void dispose() {
    _tinggiCtrl.dispose();
    _beratCtrl.dispose();
    super.dispose();
  }

  Future<void> _hitung() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    final hasil = await _controller.proses(
      tinggiCm: double.parse(_tinggiCtrl.text.replaceAll(',', '.')),
      beratKg: double.parse(_beratCtrl.text.replaceAll(',', '.')),
    );
    if (!mounted) return;
    setState(() => _loading = false);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HasilPage(hasil: hasil)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator BMI')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Masukkan data siswa',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              BmiTextField(
                controller: _tinggiCtrl,
                label: 'Tinggi badan',
                satuan: 'cm',
                ikon: Icons.height,
              ),
              const SizedBox(height: 16),
              BmiTextField(
                controller: _beratCtrl,
                label: 'Berat badan',
                satuan: 'kg',
                ikon: Icons.monitor_weight,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _loading ? null : _hitung,
                icon: const Icon(Icons.calculate),
                label: Text(_loading ? 'Memproses...' : 'Hitung BMI'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}