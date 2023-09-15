import 'package:flutter/material.dart';

import '../../../Utility/CustomTheme.dart';
import '../../../Utility/StaticData.dart';
import 'BaseInsightChild.dart';

class BaseInsights extends StatelessWidget {
  final int WQIPercent;
  final int AQIPercent;

  const BaseInsights({
    super.key,
    required this.WQIPercent,
    required this.AQIPercent,
  });

  @override
  Widget build(BuildContext context) {
    CustomThemeData OBJ = CustomThemeData.from(context);
    return Container(
      margin: EdgeInsets.only(
          top: OBJ.height * 0.01,
          left: OBJ.width * 0.01,
          right: OBJ.width * 0.01),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseInsightChild(
                percentage: WQIPercent, OBJ: OBJ, check: AIR_OR_WATER.Water),
            Container(
              height: OBJ.height * 0.05,
              width: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: OBJ.primaryColor.withOpacity(.1),
              ),
            ),
            BaseInsightChild(
                percentage: AQIPercent, OBJ: OBJ, check: AIR_OR_WATER.Air),
          ]),
    );
  }
}
