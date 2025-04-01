import 'package:flutter/material.dart';

RichText convertToRichTextDescription(String input, Color color,
    double fontSize, String fontFamily, FontWeight fontWeight, bool isCenter) {
  List<TextSpan> spans = [];

  List<String> lines = input.split("<br>");

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];

    if (line.contains(":")) {
      List<String> parts = line.split(":");
      spans.add(
        TextSpan(
          text: "${parts[0].trim()}: ",
          style: TextStyle(fontWeight: FontWeight.bold, color: color),
        ),
      );
      if (parts.length > 1) {
        spans.add(
          TextSpan(
            text: parts[1].trim(),
            style: TextStyle(color: color),
          ),
        );
      }
    } else {
      spans.add(
        TextSpan(
          text: line.trim(),
          style: TextStyle(color: color),
        ),
      );
    }

    // Komma hinzufügen außer nach dem letzten Element
    if (i < lines.length - 1) {
      spans.add(
        TextSpan(
          text: ", ",
          style: TextStyle(color: color),
        ),
      );
    }
  }

  return RichText(
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    text: TextSpan(
      children: spans,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        letterSpacing: 0.0,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
