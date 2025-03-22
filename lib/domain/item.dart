class Item {
  int id;
  int artikelnummer;
  String artikelname;
  String preis;
  String beschreibung;
  String? allergeneZusatz;
  bool pikant;
  bool vegetarisch;
  bool vegan;
  bool bestellbar;
  bool charlottenburg;
  bool friedrichshain;
  bool lichtenrade;
  bool mitte;
  bool moabit;
  bool neukoelln;
  bool potsdam;
  bool rudow;
  bool spandau;
  bool tegel;
  bool weissensee;
  bool zehlendorf;
  bool ffo;

  Item({
    required this.id,
    required this.artikelnummer,
    required this.artikelname,
    required this.preis,
    required this.beschreibung,
    this.allergeneZusatz,
    required this.pikant,
    required this.vegetarisch,
    required this.vegan,
    required this.bestellbar,
    required this.charlottenburg,
    required this.friedrichshain,
    required this.lichtenrade,
    required this.mitte,
    required this.moabit,
    required this.neukoelln,
    required this.potsdam,
    required this.rudow,
    required this.spandau,
    required this.tegel,
    required this.weissensee,
    required this.zehlendorf,
    required this.ffo,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      artikelnummer: json['artikelnummer'],
      artikelname: json['artikelname'],
      preis: json['preis'],
      beschreibung: json['beschreibung'],
      allergeneZusatz: json['allergene_zusatz'],
      pikant: json['pikant'] == 1,
      vegetarisch: json['vegetarisch'] == 1,
      vegan: json['vegan'] == 1,
      bestellbar: json['bestellbar'] == 1,
      charlottenburg: json['charlottenburg'] == 1,
      friedrichshain: json['friedrichshain'] == 1,
      lichtenrade: json['lichtenrade'] == 1,
      mitte: json['mitte'] == 1,
      moabit: json['moabit'] == 1,
      neukoelln: json['neukoelln'] == 1,
      potsdam: json['potsdam'] == 1,
      rudow: json['rudow'] == 1,
      spandau: json['spandau'] == 1,
      tegel: json['tegel'] == 1,
      weissensee: json['weissensee'] == 1,
      zehlendorf: json['zehlendorf'] == 1,
      ffo: json['FFO'] == 1,
    );
  }
}
