import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal})
      : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  // ChartBar(this.label);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
          children: <Widget>[
            SizedBox(
              height: constraints.maxHeight * 0.2,
              child: FittedBox(
                child: Text('₦/\$${spendingAmount.toStringAsFixed(1)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.04,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Color.fromARGB(255, 219, 158, 158),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 109, 108, 108),
                              width: 1.0),
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            Container(
              height: constraints.maxHeight * 0.13,
              child: FittedBox(
                child: Text(label),
                ),
              ),
          ],
        );
    },
    );
     
  }
}
