import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/hasil_bmi.dart';
import '../models/kategori_bmi.dart';

/// Logika BMI: baca JSON, hitung nilai, cocokkan kategori.
class BmiController {
  static const String _pathJson = 'assets/data/kategori_bmi.json';

  /// Membaca daftar kategori dari file JSON
  Future<List<KategoriBmi>> muatKategori() async {
    final isi = await rootBundle.loadString(_pathJson);
    final List<dynamic> data = json.decode(isi) as List<dynamic>;
    return data
        .map((e) => KategoriBmi.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Rumus BMI = berat (kg) / (tinggi (m))^2
  double hitungBmi({required double tinggiCm, required double beratKg}) {
    final tinggiM = tinggiCm / 100;
    return beratKg / (tinggiM * tinggiM);
  }

  /// Mencari kategori berdasarkan batasMin & batasMax
  KategoriBmi cariKategori(double bmi, List<KategoriBmi> daftar) {
    return daftar.firstWhere(
      (k) => k.mencakup(bmi),
      orElse: () => daftar.last,
    );
  }

  /// Proses lengkap: hitung lalu cari kategori
  Future<HasilBmi> proses({
    required double tinggiCm,
    required double beratKg,
  }) async {
    final daftar = await muatKategori();
    final bmi = hitungBmi(tinggiCm: tinggiCm, beratKg: beratKg);
    return HasilBmi(nilai: bmi, kategori: cariKategori(bmi, daftar));
  }
}