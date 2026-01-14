class Surah {
  final int number;
  final String name;
  final String arabicName;
  final String englishName;
  final String revelationType;
  final int numberOfAyahs;
  final List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.arabicName,
    required this.englishName,
    required this.revelationType,
    required this.numberOfAyahs,
    required this.ayahs,
  });
}

class Ayah {
  final int number;
  final String text;
  final String translation;
  final String transliteration;
  final int surahNumber;
  final int juz;
  final int page;

  Ayah({
    required this.number,
    required this.text,
    required this.translation,
    required this.transliteration,
    required this.surahNumber,
    required this.juz,
    required this.page,
  });
}

class Bookmark {
  final String id;
  final int surahNumber;
  final int ayahNumber;
  final DateTime createdAt;
  final String note;

  Bookmark({
    required this.id,
    required this.surahNumber,
    required this.ayahNumber,
    required this.createdAt,
    required this.note,
  });
}