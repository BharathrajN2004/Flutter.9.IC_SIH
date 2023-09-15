import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Utility/CustomTheme.dart';
import '../Utility/StaticData.dart';
import 'Components/Common/Header.dart';
import 'Components/Home/AirQualityContainer.dart';
import 'Components/Home/BaseInsights.dart';
import 'Components/Home/SeeMore.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(WATER_COMPONENT.DO, 35),
      ChartData(WATER_COMPONENT.PH, 23),
      ChartData(WATER_COMPONENT.EC, 34),
      ChartData(WATER_COMPONENT.Ca, 25),
      ChartData(WATER_COMPONENT.TDS, 40)
    ];
    CustomThemeData OBJ = CustomThemeData.from(context);
    return StreamBuilder(
      stream: null,
      builder: (context, snapshot) {
        // do this here
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
                    style: TextStyle(
                        fontSize: OBJ.largeHeaderTextSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(StaticData.network.icon!),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(headerText: "air quality"),
                SeeMore(fun: () {})
              ],
            ),
            AirQualityContainer(values: StaticData.airBubbleValues),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(headerText: "water quality"),
                SeeMore(fun: () {})
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: OBJ.height * 0.01),
                child: SfCartesianChart(
                  enableAxisAnimation: true,
                  primaryYAxis: NumericAxis(isVisible: false),
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.component.name,
                      yValueMapper: (ChartData data, _) => data.value,
                      width: .5,
                      // Sets the corner radius
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BaseInsights(AQIPercent: 60, WQIPercent: 80),
          ],
        );
      }
    );
  }
}

class ChartData {
  ChartData(
    this.component,
    this.value,
  );
  final WATER_COMPONENT component;
  final double value;
}
