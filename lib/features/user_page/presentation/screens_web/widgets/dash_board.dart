///******************************************************************************
/// Copyright (C) 2021 Savvient Technologies Pty Ltd. All Rights Reserved.
///
/// This file is part of the Gymismo Project.
///
/// Any code files that form part of the Gymismo Project cannot be copied and/or distributed without the express written permission of Savvient Technologies Pty Ltd.
///
/// Note: Copyright will be assigned as instructed by the Client that commissioned the Gymismo Project upon payment in full of all amounts due. This file is developed by Savvient Technologies Pty Ltd as part of code standards trial/ context_menus by the Client
///******************************************************************************/
import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';

class DashboardWeb extends StatelessWidget {
  const DashboardWeb({
    required this.childParent,
    super.key,
    this.isTrainingClick = true,
    this.isShowBottomBack = true,
    this.leftSelectedRoute = 'gymismo_store',
    this.topHeaderSelectPos = 0,
  });
  final Widget childParent;
  final bool isTrainingClick;
  final bool isShowBottomBack;
  final String leftSelectedRoute;
  final int topHeaderSelectPos;

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    final toolbarHeight = MediaQuery.of(context).size.height * 0.10;
    return Column(
      children: [
        // TopHeader(
        //   topHeaderSelectedPos: topHeaderSelectPos,
        // ),
        Row(
          children: [
            // if (_isDesktop(context))
            //   LeftSideMenu(
            //     isTrainingClick: isTrainingClick,
            //     isShowBottomBack: isShowBottomBack,
            //     leftSelectRoute: leftSelectedRoute,
            //     topHeaderSelectedPos: topHeaderSelectPos,
            //   )
            // else
            const SizedBox.shrink(),
            Flexible(
              flex: 3,
              child: Container(
                color: GymismoColors.backgroundColor,
                height: totalHeight - toolbarHeight,
                child: childParent,
              ),
            )
          ],
        )
      ],
    );
  }
}
