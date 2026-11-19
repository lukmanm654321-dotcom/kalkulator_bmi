/// Model satu kategori BMI yang dibaca dari assets/data/kategori_bmi.json
class KategoriBmi {
  final String nama;
  final double batasMin;
  final double batasMax;
  final String saran;

  KategoriBmi({
    required this.nama,
    required this.batasMin,
    required this.batasMax,
    required this.saran,
  });

  factory KategoriBmi.fromJson(Map<String, dynamic> json) {
    return KategoriBmi(
      nama: json['nama'] as String,
      batasMin: (json['batasMin'] as num).toDouble(),
      batasMax: (json['batasMax'] as num).toDouble(),
      saran: json['saran'] as String,
    );
  }

  /// BMI masuk kategori jika batasMin <= bmi < batasMax
  bool mencakup(double bmi) => bmi >= batasMin && bmi < batasMax;
}