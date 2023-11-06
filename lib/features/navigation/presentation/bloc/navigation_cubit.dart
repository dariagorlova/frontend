import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/core/utils/utils.dart';
import 'package:frontend/features/navigation/data/models/bottom_bar_navigation_item.dart';
import 'package:frontend/features/navigation/data/repository/bottom_bar_repository.dart';
import 'package:go_router/go_router.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final BottomBarRepository repository;
  NavigationCubit({required this.repository}) : super(const NavigationState(bottomBar: [])) {
    emit(NavigationState(bottomBar: repository.getBottomNavBarItems()));
  }

  void tapItem(BottomBarNavItemModel element) {
    // m.b some injections for get data from web for corresponding pages
    final res = <BottomBarNavItemModel>[
      for (var item in state.bottomBar) item.copyWith(isSelected: element == item)
    ];

    GoRouter.of(Utils.tabNavigation.currentContext!).go(element.route);
    emit(NavigationState(bottomBar: res));
  }
}
