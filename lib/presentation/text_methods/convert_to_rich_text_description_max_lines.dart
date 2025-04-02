import 'package:flutter/material.dart';

RichText convertToRichTextDescriptionMaxLines(
  String input,
  Color color,
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  bool isCenter,
  int maxLines,
  double maxWidth,
) {
  List<TextSpan> finalSpans = [];
   int maxVisibleLines = maxLines;

  List<String> rawLines = input.split("<br>");
  int lineCount = 0;
  bool didCut = false;

  for (String rawLine in rawLines) {
    rawLine = rawLine.trim();

    // Aufbau des Styles für Messung
    TextStyle baseStyle = TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    );

    // RichText-Stücke vorbereiten
    List<TextSpan> localSpans = [];

    if (rawLine.contains(":")) {
      List<String> parts = rawLine.split(":");
      localSpans.add(TextSpan(
          text: "${parts[0]}: ",
          style: baseStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          )));
      localSpans.add(TextSpan(
          text: parts.sublist(1).join(":").trim(),
          style: baseStyle.copyWith(color: color)));
    } else {
      localSpans.add(TextSpan(
        text: rawLine,
        style: baseStyle.copyWith(color: color),
      ));
    }

    // Messen, wie viele Zeilen diese eine visuelle Zeile belegt
    TextPainter painter = TextPainter(
      text: TextSpan(children: localSpans),
      textDirection: TextDirection.ltr,
      textAlign: isCenter ? TextAlign.center : TextAlign.start,
      maxLines: null,
    );

    painter.layout(maxWidth: maxWidth);
    int thisLineTakes = painter.computeLineMetrics().length;

    // Abbruchbedingung
    if (lineCount + thisLineTakes > maxVisibleLines) {
      didCut = true;
      break;
    }

    finalSpans.addAll(localSpans);
    finalSpans.add(const TextSpan(text: "\n"));
    lineCount += thisLineTakes;
  }

  if (didCut) {
    finalSpans.add(
      const TextSpan(
        text: "...",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  return RichText(
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    text: TextSpan(
      children: finalSpans,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    ),
  );
}
