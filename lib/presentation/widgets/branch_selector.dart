import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushiyana_flutter/application/providers/branch_provider.dart';
import 'package:sushiyana_flutter/application/providers/cart_provider.dart';
import 'package:sushiyana_flutter/presentation/widgets/fade_page_route.dart';
import 'package:sushiyana_flutter/constants/colors.dart';
import 'package:sushiyana_flutter/presentation/widgets/shopping_cart/my_small_circle_button_widget.dart';

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

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push( FadePageRoute(
          page: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.of(context).pop(),
                ),
              ),
              AlertDialog(
                backgroundColor: barColor.withValues(alpha: .9),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                content: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 300, minWidth: 250),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ListView(
                      shrinkWrap: true,
                      children: branchProvider.branches.keys.map((String key) {
                        return ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor:
                                    key == branchProvider.currentBranch
                                        ? Colors.red
                                        : Colors.transparent,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                branchProvider.branches[key]!["display_name"] ??
                                    branchProvider.branches[key]!["name"]!,
                                style:
                                    TextStyle(fontSize: fontSize, color: color),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                radius: 3,
                                backgroundColor:
                                    key == branchProvider.currentBranch
                                        ? Colors.red
                                        : Colors.transparent,
                              ),
                            ],
                          ),
                          onTap: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .setBranch(key);
                            branchProvider.setBranch(key);
                            Navigator.of(context).pop();
                          },
                        );
                      }).toList(),
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
          ),
        ));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 3, backgroundColor: Colors.red),
          const SizedBox(width: 8),
          Text(
            branchProvider
                    .branches[branchProvider.currentBranch]!["display_name"] ??
                branchProvider.branches[branchProvider.currentBranch]!["name"]!,
            style: TextStyle(fontSize: fontSize, color: color),
          ),
          const Icon(Icons.arrow_drop_down, size: 14, color: Colors.white),
        ],
      ),
    );
  }
}
