// import 'package:flutter/material.dart';
// import 'package:frontend/common_widgets/selectable_text.dart';
// import 'package:frontend/core/constants.dart';
// import 'package:frontend/features/user_settings/presentation/screens_web/widgets/dash_board.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     bool isTablet =
//         MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width < 1200;
//     bool isDesktop =
//         (MediaQuery.of(context).size.width >= 1200 && MediaQuery.of(context).size.width < 1960) ||
//             (MediaQuery.of(context).size.width >= 1960);
//     bool _isSearchViewShow = false;

//     return Scaffold(
//       drawer: (isTablet)
//           ? const Drawer(
//               child: Column(
//               children: [
//                 // DrawerPicUserName(
//                 //   username: '',
//                 //   userPic: '',
//                 // ),
//                 // LeftSideMenu(
//                 //   isTrainingClick: false,
//                 //   topHeaderSelectedPos: TopHeaderTypeIndex.storeSection,
//                 //   leftSelectRoute: 'gymismo_store',
//                 // ),
//               ],
//             ))
//           : null,
//       backgroundColor: backgroundColor,
//       body: DashboardWeb(
//         childParent: SafeArea(
//           child: ColoredBox(
//             color: backgroundColor,
//             child: Row(
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: CustomScrollView(
//                     //physics:
//                     // _isSearchViewShow
//                     //     ? const NeverScrollableScrollPhysics()
//                     //     : const AlwaysScrollableScrollPhysics(),
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     slivers: <Widget>[
//                       SliverList(
//                         delegate: SliverChildListDelegate(
//                           [
//                             Stack(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     right: commonPaddingLeftRight,
//                                     left: isTablet ? commonPaddingLeftRight : 0,
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       SelectableTextCustomStyle(
//                                         padding: const EdgeInsets.only(top: spacingExtraLarge),
//                                         text: 'Gymismo Store',
//                                         style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                               fontFamily: archivo,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w300,
//                                               fontSize: isTablet ? 10 : 12,
//                                             ),
//                                       ),
//                                       Container(
//                                         alignment: Alignment.centerLeft,
//                                         child: Stack(
//                                           children: [
//                                             AnimatedOpacity(
//                                               // If the widget is visible, animate to 0.0 (invisible).
//                                               // If the widget is hidden, animate to 1.0 (fully visible).
//                                               opacity: !_isSearchViewShow ? 1.0 : 0.0,
//                                               duration: const Duration(
//                                                 milliseconds: 400,
//                                               ),
//                                               // The green box must be a child of the AnimatedOpacity widget.
//                                               child: SelectableTextCustomStyle(
//                                                 text: '', // !!!
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 30,
//                                                   fontFamily: blinker,
//                                                   fontWeight: FontWeight.w700,
//                                                 ),
//                                               ),
//                                             ),
//                                             AnimatedOpacity(
//                                               // If the widget is visible, animate to 0.0 (invisible).
//                                               // If the widget is hidden, animate to 1.0 (fully visible).
//                                               opacity: !_isSearchViewShow ? 1.0 : 0.0,
//                                               duration: const Duration(
//                                                 milliseconds: 400,
//                                               ),
//                                               // The green box must be a child of the AnimatedOpacity widget.
//                                               child: Row(
//                                                 children: [
//                                                   const Spacer(),
//                                                   InkWell(
//                                                     onTap: () {
//                                                       if (mounted) {
//                                                         setState(() {
//                                                           _isSearchViewShow = !_isSearchViewShow;
//                                                         });
//                                                         //_showHideSearch();
//                                                       }
//                                                     },
//                                                     child: const Padding(
//                                                       padding: EdgeInsets.only(
//                                                         top: 12,
//                                                       ),
//                                                       child: Icon(
//                                                         Icons.search,
//                                                         color: Colors.white,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             AnimatedOpacity(
//                                               // If the widget is visible, animate to 0.0 (invisible).
//                                               // If the widget is hidden, animate to 1.0 (fully visible).
//                                               opacity: _isSearchViewShow ? 1.0 : 0.0,
//                                               duration: const Duration(
//                                                 milliseconds: 400,
//                                               ),
//                                               // The green box must be a child of the AnimatedOpacity widget.
//                                               child: Row(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   //if (_isSearchViewShow) _searchWidget(),
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//                                       // +++++++ main content +++++++++++++++++++++++
//                                       // _topVideoWidget(),
//                                       // _recommendedProgramsWidget(),
//                                       // Container(
//                                       //   margin: const EdgeInsets.only(
//                                       //     top: spacingExtraSmall,
//                                       //   ),
//                                       //   height: _searchRecommendedProgramList == null
//                                       //       ? 20
//                                       //       : (_searchRecommendedProgramList?.isEmpty ?? true)
//                                       //       ? 20
//                                       //       : gridViewHeight,
//                                       //   child: _buildRecommendedProgram(),
//                                       // ),
//                                       // _recommendedTrainersWidget(),
//                                       // Container(
//                                       //   margin: const EdgeInsets.only(
//                                       //     top: CommonSpacing.spacingExtraSmall,
//                                       //   ),
//                                       //   height: _searchRecommendedTrainerList == null
//                                       //       ? 20
//                                       //       : (_searchRecommendedTrainerList?.isEmpty ?? true)
//                                       //       ? 20
//                                       //       : gridViewHeight,
//                                       //   child: _buildRecommendedTrainers(),
//                                       // ),
//                                       // _favouritesTextWidget(),
//                                       // const SizedBox(
//                                       //   height: CommonSpacing.spacingExtraSmall,
//                                       // ),
//                                       // if (_searchFavoriteList?.isNotEmpty ?? false)
//                                       //   _buildFavouriteTrainers()
//                                       // else
//                                       //   _buildFavouriteEmpty(),
//                                       // const SizedBox(
//                                       //   height: 20,
//                                       // )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // if (isDesktop)
//                 //   SizedBox(
//                 //     width: CommonMethod.getWorkoutProgramPickerWidth(
//                 //       context,
//                 //     ),
//                 //     child: const SizedBox.shrink(),
//                 //   )
//               ],
//             ),
//           ),
//         ),
//         isTrainingClick: false,
//         topHeaderSelectPos: 2,
//       ),
//     );
//   }
// }
