import 'package:sushiyana_flutter/application/get_image_url_cdn.dart';

class Item {
  String id;
  String artikelnummer;
  String artikelname;
  String preis;
  String beschreibung;
  String allergeneZusatz;
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
  String imagePath;

  Item({
    required this.id,
    required this.artikelnummer,
    required this.artikelname,
    required this.preis,
    required this.beschreibung,
    required this.allergeneZusatz,
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
    required this.imagePath,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      // id: json['id'] is int
      //     ? json['id']
      //     : int.tryParse(json['id'].toString()) ?? 0,
      // artikelnummer: json['artikelnummer'] is int
      //     ? json['artikelnummer']
      //     : int.tryParse(json['artikelnummer'].toString()) ?? 0,
      id: json['id'].toString(),
      artikelnummer: json['artikelnummer'].toString(),
      artikelname: json['artikelname'].toString(),
      preis: json['preis'].toString(),
      beschreibung: json['beschreibung'].toString(),
      allergeneZusatz: json['allergene_zusatz'].toString(),
      pikant: json['pikant'] == "1",
      vegetarisch: json['vegetarisch'] == "1",
      vegan: json['vegan'] == "1",
      bestellbar: json['bestellbar'] == "1",
      charlottenburg: json['charlottenburg'] == "1",
      friedrichshain: json['friedrichshain'] == "1",
      lichtenrade: json['lichtenrade'] == "1",
      mitte: json['mitte'] == "1",
      moabit: json['moabit'] == "1",
      neukoelln: json['neukoelln'] == "1",
      potsdam: json['potsdam'] == "1",
      rudow: json['rudow'] == "1",
      spandau: json['spandau'] == "1",
      tegel: json['tegel'] == "1",
      weissensee: json['weissensee'] == "1",
      zehlendorf: json['zehlendorf'] == "1",
      ffo: json['FFO'] == "1",
      imagePath: getImageUrlCdn(json['image_path'].toString()),
    );
  }
}

