import 'package:frontend/features/calendar_page/presentation/screen/calendar_page.dart';
import 'package:frontend/features/main_page/presentation/screen/main_page.dart';
import 'package:frontend/features/navigation/data/models/bottom_bar_navigation_item.dart';
import 'package:frontend/features/programs_page/presentation/screen/programs_page.dart';
import 'package:frontend/features/store_page/presentation/screen/store_page.dart';
import 'package:frontend/features/user_page/presentation/screens/user_page.dart';

class BottomBarRepository {
  List<BottomBarNavItemModel> getBottomNavBarItems() {
    return const <BottomBarNavItemModel>[
      BottomBarNavItemModel(
        //icon: Icons.abc,
        icon: 'assets/images/ic_home.png',
        label: 'Home',
        route: MainPage.route,
        isSelected: true,
      ),
      BottomBarNavItemModel(
        //icon: Icons.calendar_month,
        icon: 'assets/images/ic_calendar.png',
        label: 'Calendar',
        route: CalendarPage.route,
      ),
      BottomBarNavItemModel(
        //icon: Icons.access_alarm,
        icon: 'assets/images/ic_store.png',
        label: 'Store',
        route: StorePage.route,
      ),
      BottomBarNavItemModel(
        //icon: Icons.baby_changing_station,
        icon: 'assets/images/ic_program.png',
        label: 'Programs',
        route: ProgramsPage.route,
      ),
      BottomBarNavItemModel(
        //icon: Icons.settings,
        icon: 'assets/images/ic_user.png',
        label: 'Settings',
        route: UserPage.route,
      ),
    ];
  }
}
