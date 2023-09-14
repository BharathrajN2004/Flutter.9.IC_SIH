import 'package:flutter/material.dart';

import '../../../Utility/CustomTheme.dart';
import '../../../Utility/StaticData.dart';
import 'AirBubble.dart';
import 'AirBubbleText.dart';

class AirQualityContainer extends StatefulWidget {
  final List<double> values;
  const AirQualityContainer({super.key, required this.values});

  @override
  State<AirQualityContainer> createState() => _AirQualityContainerState();
}

class _AirQualityContainerState extends State<AirQualityContainer> {
  AIRBUBBLE? currentAirBubble;
  @override
  Widget build(BuildContext context) {
    CustomThemeData OBJ = CustomThemeData.from(context);
    return Expanded(
      child: Container(
        margin:
            EdgeInsets.only(top: OBJ.height * 0.01, bottom: OBJ.height * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: OBJ.height,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: OBJ.height * 0.04,
                      right: OBJ.width * 0.04,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          currentAirBubble = AIRBUBBLE.Nitrogen;
                          print(currentAirBubble.toString());
                        }),
                        child: AirBubble(
                          maxHeight: 25,
                          maxWidth: 25,
                          gradientColors:
                              OBJ.airBubbleColors[AIRBUBBLE.Nitrogen]!,
                          radius: 100,
                          child:
                              AirBubbleText(text: widget.values[2].toString()),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: OBJ.height * 0.06,
                      left: 0,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          currentAirBubble = AIRBUBBLE.CarbonDioxide;
                          print(currentAirBubble.toString());
                        }),
                        child: AirBubble(
                          maxHeight: -25,
                          maxWidth: -25,
                          gradientColors:
                              OBJ.airBubbleColors[AIRBUBBLE.CarbonDioxide]!,
                          radius: 50,
                          child:
                              AirBubbleText(text: widget.values[1].toString()),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: OBJ.width * 0.15,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          currentAirBubble = AIRBUBBLE.Oxygen;
                          print(currentAirBubble.toString());
                        }),
                        child: AirBubble(
                          maxHeight: -15,
                          maxWidth: 25,
                          gradientColors:
                              OBJ.airBubbleColors[AIRBUBBLE.Oxygen]!,
                          radius: 20,
                          child:
                              AirBubbleText(text: widget.values[0].toString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: OBJ.height * 0.02),
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors:
                                  OBJ.airBubbleColors[AIRBUBBLE.values[index]]!,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            AIRBUBBLE.values[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: OBJ.subTextSize),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
