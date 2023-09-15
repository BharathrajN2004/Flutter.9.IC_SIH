import 'package:flutter/material.dart';

import '../../../Utility/CustomTheme.dart';
import '../../../Utility/StaticData.dart';

class BaseInsightChild extends StatelessWidget {
  const BaseInsightChild({
    super.key,
    required this.percentage,
    required this.OBJ,
    required this.check,
  });
  final AIR_OR_WATER check;
  final int percentage;
  final CustomThemeData OBJ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$percentage%",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: OBJ.headerTextSize,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                check.name.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: OBJ.textSize),
              ),
              Text(
                "good to have ",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: OBJ.smallTextSize),
              ),
            ],
          )
        ],
      ),
    );
  }
}
