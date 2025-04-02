import 'package:flutter/material.dart';

int calculateLineCountForDescription({
  required String text,
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required double maxWidth,
  required TextAlign textAlign,
}) {
  final List<String> logicalLines = text.split("<br>");
  int totalLines = 0;

  for (final line in logicalLines) {
    final TextSpan span = TextSpan(
      text: line.trim(),
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );

    final TextPainter painter = TextPainter(
      text: span,
      maxLines: null,
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
    );

    painter.layout(maxWidth: maxWidth);

    totalLines += painter.computeLineMetrics().length;
  }

  return totalLines;
}
