import 'package:flutter/material.dart';

import '../../../Utility/CustomTheme.dart';

class SeeMore extends StatelessWidget {
  final Function fun;
  const SeeMore({super.key, required this.fun});

  @override
  Widget build(BuildContext context) {
    CustomThemeData OBJ = CustomThemeData.from(context);
    return GestureDetector(
      onTap: () => fun,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: OBJ.primaryColor.withOpacity(.1),
          border:
              Border.all(color: OBJ.primaryColor.withOpacity(.2), width: .5),
        ),
        child: Text(
          "See More",
          style: TextStyle(
              fontSize: OBJ.textSize,
              color: OBJ.primaryColor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
