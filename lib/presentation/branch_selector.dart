import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/branch_provider.dart';
import 'package:sushiyana_flutter/constants/colors.dart';

class BranchSelector extends StatelessWidget {
  const BranchSelector({
    super.key,
    required this.fontSize,
    required this.color,
  });

  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);

    return DropdownButton<String>(
      value: branchProvider.currentBranch,
      isDense: true,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
      dropdownColor: barColor.withValues(alpha: 0.9),
      items: branchProvider.branches.keys.map((String key) {
        return DropdownMenuItem<String>(
          value: key,
          child: Row(
            children: [
              CircleAvatar(
                radius: 3,
                backgroundColor: key == branchProvider.currentBranch
                    ? Colors.red
                    : Colors.transparent, // Nur für den aktuellen Branch rot
              ),
              const SizedBox(
                  width: 8), // Abstand zwischen CircleAvatar und Text
              Text(
                branchProvider.branches[key]!["display_name"] ??
                    branchProvider.branches[key]!["name"]!,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (String? newBranch) {
        if (newBranch != null) {
          branchProvider.setBranch(newBranch);
        }
      },
    );
  }
}
