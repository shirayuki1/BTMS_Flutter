import 'package:get/get.dart';

class SelectedBird {
  final String? name;
  final int? bird_id;
  var isSelected = false.obs;
  SelectedBird({this.name, this.bird_id, required this.isSelected});
}
