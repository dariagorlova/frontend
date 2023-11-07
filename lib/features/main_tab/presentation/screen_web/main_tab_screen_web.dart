import 'package:flutter/material.dart';
import 'package:frontend/core/common_method.dart';
import 'package:frontend/core/navigation/navigations_keys.dart';
import 'package:frontend/core/styles/colors.dart';

class MainTabScreenWeb extends StatelessWidget {
  static const String route = NavigationRouteNames.mainTabScreenWeb;
  const MainTabScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          //TopHeaderMenu(), // logo, [store], [training], ["Welcome, User", avatar]
          Row(
            children: [
              //
              if (CommonMethod.isDesktop(context))
                const Column() //LeftSideMenu() // 3 variants
              else
                const SizedBox.shrink(),

              // main content
              Flexible(
                flex: 3,
                child: Container(
                  color: GymismoColors.backgroundColor,
                  height: totalHeight * 0.9,
                  child: const Center(
                    child: Text('Main Screen'),
                  ), //MainContent(), // change everytime
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
