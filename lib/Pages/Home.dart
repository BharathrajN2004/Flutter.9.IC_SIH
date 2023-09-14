import 'package:flutter/material.dart';

import '../Utility/CustomTheme.dart';
import '../Utility/StaticData.dart';
import 'Components/Common/Header.dart';
import 'Components/Home/AirQualityContainer.dart';
import 'Components/Home/SeeMore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    CustomThemeData OBJ = CustomThemeData.from(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: OBJ.height * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(StaticData.location.icon!),
              Text(
                "A/WQI",
                style: TextStyle(fontSize: OBJ.headerTextSize),
              ),
              Icon(StaticData.network.icon!)
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Header(headerText: "air quality"), SeeMore(fun: () {})],
        ),
        AirQualityContainer(values: StaticData.airBubbleValues),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AIR QUALITY",
                  style: TextStyle(fontSize: OBJ.subTextSize),
                ),
                SizedBox(
                  height: OBJ.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: OBJ.height * 0.01,
                      left: OBJ.width * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text("60%"), Text("good to have")],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: OBJ.height * 0.01, right: OBJ.width * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Text("60%"), Text("good to have")],
                    ),
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
