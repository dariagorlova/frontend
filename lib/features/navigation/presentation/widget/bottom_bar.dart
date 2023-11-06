import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/styles.dart';
import 'package:frontend/features/navigation/presentation/bloc/navigation_cubit.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(GymismoStyles.spacingExtraSmall),
          color: GymismoColors.backgroundColor,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: state.bottomBar
                .map((e) => Container(
                      padding: const EdgeInsets.all(GymismoStyles.spacingExtraSmall),
                      color: GymismoColors.backgroundColor,
                      child: IconButton(
                        onPressed: () {
                          context.read<NavigationCubit>().tapItem(e);
                        },
                        //icon: Icon(e.icon,color: e.isSelected ? Colors.white : Colors.black,),
                        icon: Image.asset(e.icon, width: 25, height: 25),
                      ),
                    ))
                .toList()
                .animate(interval: 200.ms)
                .slideY(begin: 1, end: 0, duration: 0.5.seconds, curve: Curves.easeInOut),
          ),
        );
      },
    );
  }
}
