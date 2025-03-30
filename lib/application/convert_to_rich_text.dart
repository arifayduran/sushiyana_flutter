import 'package:flutter/material.dart';

RichText convertToRichText(String input, Color color, double fontSize, String fontFamily, FontWeight fontWeight, bool isCenter) {
  List<TextSpan> spans = [];

  List<String> lines = input.split("<br>");

  for (String line in lines) {
    if (line.contains(":")) {
      List<String> parts = line.split(":");
      if (parts.length > 1) {
        spans.add(
          TextSpan(
            text: "${parts[0]}: ",
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
        );
        spans.add(
          TextSpan(
            text: "${parts[1].trim()}\n",
            style: TextStyle(color: color),
          ),
        );
      }
    } else {
      spans.add(
        TextSpan(
          text: "${line.trim()}\n",
          style: TextStyle(color: color),
        ),
      );
    }
  }

  return RichText(
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    text: TextSpan(
      children: spans,
      
      style: TextStyle(fontSize: fontSize, color: color, fontFamily: fontFamily, fontWeight: fontWeight),
    ),
  );
}
