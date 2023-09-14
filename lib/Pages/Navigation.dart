import 'package:flutter/material.dart';

import '../Utility/StaticData.dart';
import 'AIPrediction.dart';
import 'Home.dart';
import '../Utility/CustomTheme.dart';
import 'Profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final List<Widget> widgetList = const [
    AIPrediction(),
    Home(),
    Profile(),
  ];

  int index = 1;

  @override
  Widget build(BuildContext context) {
    CustomThemeData OBJ = CustomThemeData.from(context);
    return Container(
      decoration: BoxDecoration(gradient: OBJ.mainGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedIconTheme: const IconThemeData(size: 36),
            unselectedIconTheme: const IconThemeData(size: 34),
            items: [
              navBarItem(
                  icon: StaticData.aiPrediction.icon!, state: 0, OBJ: OBJ),
              navBarItem(icon: StaticData.home.icon!, state: 1, OBJ: OBJ),
              navBarItem(icon: StaticData.profile.icon!, state: 2, OBJ: OBJ),
            ]),
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(
            top: OBJ.topPadding,
            left: OBJ.harizontalPadding,
            right: OBJ.harizontalPadding,
          ),
          child: IndexedStack(
            index: index,
            children: widgetList,
          ),
        )),
      ),
    );
  }

  BottomNavigationBarItem navBarItem({
    required IconData icon,
    required int state,
    required CustomThemeData OBJ,
  }) {
    return BottomNavigationBarItem(
      tooltip: 'Home',
      icon: Icon(
        icon,
        color: state == index ? OBJ.activeIconColor : OBJ.iconColor,
        // shadows: state == index
        //     ? [
        //         Shadow(
        //           color: OBJ.activeIconColor.withOpacity(.8),
        //           blurRadius: 20,
        //         )
        //       ]
        //     : [],
      ),
      label: '',
    );
  }
}
