import 'package:explore_app/objects/option.dart';

class Category{
  final String name;
  bool isSelected;
  final List<Option> options;
  bool isDropDownMenu;
  Category({required this.name, required this.isSelected, required this.options, required this.isDropDownMenu});
}