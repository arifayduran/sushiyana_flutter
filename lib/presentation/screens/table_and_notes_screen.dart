import 'package:flutter/material.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/widgets/my_small_circle_button_widget.dart';

class TableAndNotesScreen extends StatefulWidget {
  const TableAndNotesScreen({super.key});

  @override
  State<TableAndNotesScreen> createState() => _TableAndNotesScreenState();
}

class _TableAndNotesScreenState extends State<TableAndNotesScreen> {
  final TextEditingController tableNumberController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  bool isTableNumberEmpty = false;

  @override
  void dispose() {
    tableNumberController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 330, maxHeight: 500),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: yanaColor.withValues(alpha: .9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fast fertig!',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Julee",
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w900,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: tableNumberController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: .1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: isTableNumberEmpty
                                ? Colors.red
                                : Colors.transparent,
                          ),
                        ),
                        hintText: isTableNumberEmpty
                            ? 'Tischnummer erforderlich!'
                            : 'Tischnummer eingeben...',
                        hintStyle: TextStyle(
                          color:
                              isTableNumberEmpty ? Colors.red : Colors.white70,
                          fontFamily: "Julee",
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: notesController,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: .1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Ihre Notiz für die Bestellung... (optional)',
                        hintStyle: const TextStyle(
                            color: Colors.white70,
                            fontFamily: "Julee",
                            fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            tableNumberController.clear();
                            notesController.clear();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Abbrechen",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Julee",
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600,
                              color: Colors.redAccent.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            final tableNumber = tableNumberController.text;
                            if (tableNumber.isEmpty) {
                              setState(() {
                                isTableNumberEmpty = true;
                              });
                              return;
                            }
                            setState(() {
                              isTableNumberEmpty = false;
                            });
                            final notes = notesController.text == ""
                                ? null
                                : notesController.text;
                            Navigator.pop(context,
                                {'tableNumber': tableNumber, 'notes': notes});
                          },
                          child: Text(
                            "Speichern",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Julee",
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 20,
            right: 20,
            child: MySmallCircleButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              strokewidth: 0.5,
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
