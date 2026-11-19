import 'package:flutter/material.dart';

/// Input angka reusable dengan validasi tidak boleh kosong
class BmiTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String satuan;
  final IconData ikon;

  const BmiTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.satuan,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: '$label ($satuan)',
        prefixIcon: Icon(ikon),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$label tidak boleh kosong';
        }
        final angka = double.tryParse(value.replaceAll(',', '.'));
        if (angka == null || angka <= 0) {
          return '$label harus berupa angka lebih dari 0';
        }
        return null;
      },
    );
  }
}