import 'package:flutter/material.dart';

import '../../../Utility/CustomTheme.dart';

class Header extends StatelessWidget {
  final String headerText;
  const Header({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    CustomThemeData OBJ = CustomThemeData.from(context);
    return Text(
      headerText.toUpperCase(),
      style: TextStyle(
        fontSize: OBJ.mediumTextSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
