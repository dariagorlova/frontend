import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_bar_navigation_item.freezed.dart';

@Freezed()
class BottomBarNavItemModel with _$BottomBarNavItemModel {
  const factory BottomBarNavItemModel({
    required String icon,
    required String label,
    required String route,
    @Default(false) bool isSelected,
  }) = _BottomBarNavItemModel;
}
