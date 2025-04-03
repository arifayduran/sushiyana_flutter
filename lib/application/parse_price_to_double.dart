double? parsePriceToDouble(String input) {
  try {
    // Nur Ziffern, Punkt und Komma behalten
    String cleaned = input.replaceAll(RegExp(r'[^0-9.,]'), '');

    // Wenn sowohl Komma als auch Punkt vorkommen:
    // -> Komma = Tausendertrennzeichen, Punkt = Dezimal
    if (cleaned.contains(',') && cleaned.contains('.')) {
      cleaned = cleaned.replaceAll(',', ''); // Kommas raus (Tausender)
    }
    // Wenn nur Komma vorkommt: deutsches Format → Komma als Dezimal
    else if (cleaned.contains(',') && !cleaned.contains('.')) {
      cleaned = cleaned.replaceFirst(',', '.'); // Komma zu Punkt
    }
    // Wenn nur Punkt vorkommt, ist alles ok

    return double.parse(cleaned);
  } catch (e) {
    throw Exception('Error parsing price: $e');
  }
}
