import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/common_widgets/rectangle_button.dart';
import 'package:frontend/core/navigation/navigations_keys.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/user_page/presentation/bloc/user_cubit.dart';
import 'package:frontend/features/user_page/presentation/screens/auth_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_models/shared_models.dart' as shared;

class UserPage extends StatelessWidget {
  static const String route = NavigationRouteNames.userDetailsPage;
  final shared.User user;

  const UserPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: GymismoColors.backgroundColor,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: GymismoStyles.spacingMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GymismoStyles.h50,
                Text(
                  'Welcome ${user.userName}',
                  style: GymismoStyles.tsWhiteBlinker26w600,
                ),
                GymismoStyles.h24,
                RectangleButton(
                  text: 'LOGOUT',
                  bgColor: GymismoColors.gainsBoro,
                  onClick: () {
                    context.read<UserCubit>().logOut();
                    GoRouter.of(Utils.mainNavigation.currentContext!).go(AuthScreen.route);
                  },
                ),
                GymismoStyles.h16,
                RectangleButton(
                  text: 'DELETE ACCOUNT',
                  bgColor: GymismoColors.burntSienna,
                  onClick: () {
                    context.read<UserCubit>().deleteAccount();
                    GoRouter.of(Utils.mainNavigation.currentContext!).go(AuthScreen.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
