import 'package:AWQI/Utility/StaticData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ThemeProvider.dart';

class CustomThemeData {
  final double aspectRatio;
  final double height;
  final double width;

  final double topPadding;
  final double harizontalPadding;

  final double smallTextSize;
  final double mediumTextSize;
  final double textSize;
  final double subHeaderTextSize;
  final double headerTextSize;
  final double largeHeaderTextSize;

  final Color primaryColor;
  final Color secondaryColor;
  final Gradient mainGradient;
  final Color iconColor;
  final Color activeIconColor;
  final Color borderColor;
  final Map<AIRBUBBLE, List<Color>> airBubbleColors;

  CustomThemeData({
    required this.aspectRatio,
    required this.height,
    required this.width,
    required this.topPadding,
    required this.harizontalPadding,
    required this.textSize,
    required this.subHeaderTextSize,
    required this.headerTextSize,
    required this.smallTextSize,
    required this.mediumTextSize,
    required this.largeHeaderTextSize,
    required this.primaryColor,
    required this.secondaryColor,
    required this.mainGradient,
    required this.iconColor,
    required this.activeIconColor,
    required this.borderColor,
    required this.airBubbleColors,
  });

  factory CustomThemeData.from(context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);

    double aspectRatio = MediaQuery.of(context).size.aspectRatio;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double topPadding = height * 0.01;
    double harizontalPadding = width * 0.04;

    double smallTextSize = aspectRatio * 22;
    double mediumTextSize = aspectRatio * 30;
    double textSize = aspectRatio * 27;
    double largeHeaderTextSize = aspectRatio * 40;
    double subHeaderTextSize = aspectRatio * 32;
    double headerTextSize = aspectRatio * 35;

    Color primaryColor = provider.isDark ? Colors.white : Colors.black87;
    Color secondaryColor = provider.isDark ? Colors.black87 : Colors.white;

    Gradient mainGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: provider.isDark
          ? const [Color(0xFF171717), Color(0xFF151617)]
          : const [Color.fromARGB(255, 252, 253, 255), Color.fromARGB(255, 255, 255, 255)],
    );
    Color iconColor = provider.isDark ? Colors.white : const Color(0xFFAEADAD);
    Color activeIconColor =
        provider.isDark ? const Color(0xFF7D5DFF) : const Color(0xFFF17A5E);
    Color borderColor =
        provider.isDark ? Colors.white60 : const Color(0xFFAEADAD);
    Map<AIRBUBBLE, List<Color>> airBubbleColors = {
      AIRBUBBLE.Nitrogen: const [
        Color.fromARGB(255, 56, 165, 105),
        Color.fromARGB(255, 70, 212, 155)
      ],
      AIRBUBBLE.Oxygen: const [
        Color.fromARGB(255, 2, 124, 224),
        Color.fromARGB(255, 42, 221, 245)
      ],
      AIRBUBBLE.CarbonDioxide: const [
        Color.fromARGB(255, 91, 121, 137),
        Color.fromARGB(255, 126, 172, 196)
      ]
    };

    return CustomThemeData(
      aspectRatio: aspectRatio,
      height: height,
      width: width,
      textSize: textSize,
      subHeaderTextSize: subHeaderTextSize,
      headerTextSize: headerTextSize,
      smallTextSize: smallTextSize,
      mediumTextSize: mediumTextSize,
      largeHeaderTextSize: largeHeaderTextSize,
      topPadding: topPadding,
      harizontalPadding: harizontalPadding,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      mainGradient: mainGradient,
      iconColor: iconColor,
      activeIconColor: activeIconColor,
      borderColor: borderColor,
      airBubbleColors: airBubbleColors,
    );
  }
}
