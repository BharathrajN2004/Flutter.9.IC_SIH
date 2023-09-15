import 'package:flutter/material.dart';

enum AIRBUBBLE { Oxygen, CarbonDioxide, Nitrogen }

enum AIR_OR_WATER { Air, Water }

enum WATER_COMPONENT { TDS, DO, PH, EC, Ca }

class StaticData {
  static const Icon eco = Icon(Icons.eco);
  static const Icon waterDrop = Icon(Icons.water_drop);
  static const Icon aiPrediction = Icon(Icons.auto_awesome_outlined);
  static const Icon home = Icon(Icons.home_rounded);
  static const Icon profile = Icon(Icons.person_rounded);
  static const Icon location = Icon(Icons.location_pin);
  static const Icon network = Icon(Icons.network_check_rounded);

  // For Testing purposes
  static const List<double> airBubbleValues = [0.43, 31.16, 58.32];
}
