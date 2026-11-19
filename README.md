# Kalkulator BMI (Soal 9)

Aplikasi Flutter untuk menghitung BMI siswa. Arsitektur MVC, kategori dibaca dari `assets/data/kategori_bmi.json`.

## Struktur
- `lib/models` : KategoriBmi, HasilBmi
- `lib/controllers` : BmiController (hitung BMI, baca JSON, cari kategori)
- `lib/views` : InputPage, HasilPage
- `lib/widgets` : BmiTextField
- `assets/data` : kategori_bmi.json

## Menjalankan
```
flutter create . --platforms=android
flutter pub get
flutter run
```

## Build APK via GitHub
Push ke branch `main`, lalu ambil APK di tab Actions > Build APK > Artifacts.