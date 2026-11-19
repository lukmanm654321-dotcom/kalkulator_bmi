import 'kategori_bmi.dart';

/// Model hasil perhitungan: nilai BMI + kategori yang cocok
class HasilBmi {
  final double nilai;
  final KategoriBmi kategori;

  HasilBmi({required this.nilai, required this.kategori});
}